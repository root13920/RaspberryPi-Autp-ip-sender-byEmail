#coding=utf-8
import smtplib
from email.mime.text import MIMEText
from datetime import datetime
import sys


if __name__ =='__main__':
    print ("Start to grep ip address")

now = datetime.now()

msg_from = 'xxxxxxx@qq.com'  # Sender email address
passwd = 'xxxxxxxxx'  #  Sender's SMTP authenticated key
msg_to = 'xxxxxxxx@qq.com'  # Revceiver email address

subject = "Your ip address..timestamp:"+str(now.date())  # 主题
content = sys.argv[1]
msg = MIMEText(content)
msg['Subject'] = subject
msg['From'] = msg_from
msg['To'] = msg_to
try:
    s = smtplib.SMTP_SSL("smtp.qq.com", 465) # The port of email server
    s.login(msg_from, passwd)
    s.sendmail(msg_from, msg_to, msg.as_string())
    print "Successfully sending"
except s.SMTPException, e:
    print ("Error!")
    pass
finally:
    s.quit()
