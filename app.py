from flask import Flask, render_template, request, send_from_directory
import os
import subprocess
import re
import sys

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
CONVERTED_FOLDER = 'converted'

os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(CONVERTED_FOLDER, exist_ok=True)

def libreoffice_exec():
    if os.name == 'posix':  # macOS/Linux
        return '/Applications/LibreOffice.app/Contents/MacOS/soffice' if sys.platform == 'darwin' else 'libreoffice'
    elif os.name == 'nt':  # Windows
        return 'C:\\Program Files\\LibreOffice\\program\\soffice.exe'

def convert_to_pdf(source, timeout=None):
    args = [libreoffice_exec(), '--headless', '--convert-to', 'pdf', '--outdir', CONVERTED_FOLDER, source]
    process = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout)
    stdout = process.stdout.decode()
    stderr = process.stderr.decode()

    print("STDOUT:", stdout)  # Log stdout
    print("STDERR:", stderr)  # Log stderr

    filename = re.search(r'-> (.*?) using filter', stdout)
    if filename is None:
        raise Exception(f"Conversion failed: {stdout or stderr}")
    return os.path.basename(filename.group(1))

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return "No file part", 400
    file = request.files['file']
    if file.filename == '':
        return "No selected file", 400
    file_path = os.path.join(UPLOAD_FOLDER, file.filename)
    file.save(file_path)

    try:
        converted_file = convert_to_pdf(file_path)
        return send_from_directory(CONVERTED_FOLDER, converted_file, as_attachment=True)
    except Exception as e:
        return str(e), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)


