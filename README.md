
<div dir="rtl">


<b>ماژول ZarinPal_Payment</b>

سازندگان: عماد معزز و علیرضا حسن زاده


برای استفاده از ماژول زرین پال پی منت مراحل زیر را انجام دهید:

1-ماژول را به پروژه خود اضافه کنید.
2-php هایتان را روی هاست خود بارگذاری کرده سپس آدرس فایل php تون رو در ماژول در بخش Initialize نوشته. منظور آدرس آن پوشه ای که درون آن فایل های php رو ریختین: مثال -> www.google.com/ZarinPal-Payment
3-لایوت L_ZarinPal_Payment را در دیزاینر لود کنید.
4-کتاب خانه های  (HttpUtils2, RichString, StringUtils, StatusBarCompat, JISON, IME, phone) را به پروژه خود اضافه کنید.
5-آیتم هایی که در بخش Initialize ماژول قرار دارند را تکمیل کنید.
6-کد های زیر را در آنجایی که میخواهید ماژول را فرا بخوانید بنویسید.(مقادیر ایمیل و شماره تلفن همراه را از مشتری بخواهید!)
  ZarinPal_Payment.money = "" ' مبلغ تراکنش به تومان
  MONEY ZarinPal_Payment.Description = "" ' توضیحاتی درباره خرید
   Description ZarinPal_Payment.E_Mail = "" ' ایمیل مشتری
  Mail ZarinPal_Payment.phone = "" ' شماره مشتری
  phone ZarinPal_Payment.Activity_Now = Me ' لطفا این قسمت را عوض نکنید!
  StartActivity (ZarinPal_Payment)
7- این ساب مقادیر (کد پیگیری و وضعیت تراکنش) را برگشت میزند. که اگر 100 یا 101 بود پرداخت موفق در غیر این صورت پرداخت ناموفق
  Sub Zarin_Pal_Request( Status As String, Kod_Payment As String) 
    'اگر ستاتوس برابر 100 يا 101 بود تراکنش موفق بوده! 'اگر استاتوس برابر تال يا ... بود تراکنش ناموفق 
    Msgbox("وضعيت تراکنش: "&Status& CRLF&"کد پيگيري تراکنش: " & Kod_Payment ,"") Log(Status& CRLF & Kod_Payment)
  End Sub

در صورت داشتن ابهام به این ایمیل پیام دهید!
programingcenter.97@gmail.com

</div>
