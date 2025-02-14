import glob, datetime as dt
from pypdf import PdfWriter

APP_HOME='/usr/src/app'

def combine():
    pw = PdfWriter()
    files = sorted(glob.glob(f"{APP_HOME}/input/*"))
    if len(files) < 1:
        print('No Input')
        return
    
    for file in files:
        pw.append(file)

    now = dt.datetime.now().strftime('%Y%m%d%H%M%S')
    pw.write(f"{APP_HOME}/output/{now}.pdf")
    pw.close()
    print("Finish!")

if __name__ == '__main__':
    combine()
