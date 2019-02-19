B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=8.8
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

'Guide To using this module
'To use this module, Do the following:
'1- Put the PHP files that are included with the module on your site. And in the last character of the address there Is no / .
'2- Add L_ZarinPal_Payment Layout To the Designer.
'3- Add libraries (HttpUtils2, RichString, StringUtils, StatusBarCompat, JISON, IME, phone).
'4- In the Module's Initialize, be sure to enter the required items.
'5- Place the following code where you want To call the module.

'	ZarinPal_Payment.money = "101" 'MONEY
'	ZarinPal_Payment.Description = "Hello to you" 'Description
'	ZarinPal_Payment.E_Mail = "a.hassanzadeh.1381@gmail.com" 'Mail
'	ZarinPal_Payment.phone = "09152079018" 'phone
'	ZarinPal_Payment.Activity_Now = Me 'don't change this Line
'	StartActivity (ZarinPal_Payment)

'6- put the same in the same part.

'	Sub Zarin_Pal_Request( Status As String, Kod_Payment As String)
'		'اگر ستاتوس برابر 100 یا 101 بود تراکنش موفق بوده!
'		Msgbox("وضعیت تراکنش: "&Status& CRLF&"کد پیگیری تراکنش: " & Kod_Payment ,"")
'		Log(Status& CRLF & Kod_Payment)
'	End Sub

'To contact support, email the following message. (programingcenter.97@gmail.com)


Sub Initialize
	'Created By Alireza Hassanzadeh & Emad Moazzaz 
	'site: Programing-center.ir & senatorteam.tk
	'you have to complete this form to run
	'Add L_ZarinPal_Payment Layout in Designer**
	'Add These Library
	'1-HttpUtils2       (Version: 2.50 or use New Version)**
	'2-RichString       (Version: 1.40 or use New Version)**
	'3-StringUtils      (Version: 1.12 or use New Version)**
	'4-StatusBarCompat  (Version: 1.00 or use New Version)**
	'5-JSON             (Version: 1.10 or use New Version)**
	'6-IME              (Version: 1.10 or use New Version)**
	'7-phone            (Version: 2.50 or use New Version)**
	
	Merchand_ID = ' ""                                        '** Write your Merchant ID (if you don't have , you can make Account in Zarinpal.com)
	logo = ' LoadBitmap(File.DirAssets,"Icon.png")            '** Write your logo address. Be sure to insert DirAssets or DirInternal (it Means software's icon)
	Start_HostName_With = ' ""                               '** the end of HastName without / it's very importent***
	Font= ' Typeface.LoadFromAssets("iransans_medium.ttf")    '** For a more beautiful view
	
End Sub

Sub Process_Globals
	Dim phone As String 
	Dim E_Mail As String
	Dim Description As String
	Dim money As String
	Dim Activity_Now As Object
End Sub

private Sub Globals
	Private htt As HttpJob
	Private WebView As WebView
	Private lbl_SSL As Label
	Private lbl_Address As Label
	Private bool As Boolean = False
	Private pnl As Panel
	Private lbl_SSL_Panel As Label
	Private lbl_SSL_About As Label
	Private r As RichString
	Private ab As String
	Private timer As Timer
	Private timer_OK As Timer
	Private Merchand_ID As String
	Private logo As Bitmap
	Private Start_HostName_With As String
	Private Font As Typeface
	Private Img_Icon As ImageView
	Private StatusBar As StatusBarCompat
	Private nb As IME
	Private ph As Phone
End Sub
'Created By Alireza Hassanzadeh & Emad Moazzaz, Programing Center
'site: Programing-center.ir
private Sub Activity_Create(FirstTime As Boolean)
	ph.SetScreenOrientation(1)
	Activity.LoadLayout("L_ZarinPal_Payment")
	Initialize
	lbl_Address.SingleLine= True
	timer.Initialize("timer",10)
	timer.Enabled=True
	timer_OK.Initialize("timer_OK",10)
	timer_OK.Enabled=True
	SetLabelTextSize(lbl_SSL,"",15)
	lbl_Address.Typeface=Font
	Img_Icon.Bitmap=logo
	If pnl.IsInitialized=False Then
		pnl.Initialize("pnl")
	End If
	If lbl_SSL_Panel.IsInitialized = False Then
		lbl_SSL_Panel.Initialize("lbl_SSL_Panel")
	End If
	If lbl_SSL_About.IsInitialized = False Then
		lbl_SSL_About.Initialize("lbl_SSL_About")
	End If
	StatusBar.Initialize
	StatusBar.StatusBarColor = Colors.RGB(255,220,8)
	Activity.AddView(pnl,1%x,11%y,80%x,42%y)
	pnl.Visible=False
	pnl.AddView(lbl_SSL_Panel,0%x,0%y,81%x,20%y)
	pnl.AddView(lbl_SSL_About,1%x,21%y,78%x,20%y)
	pnl.Color=Colors.RGB(255,220,8)
	lbl_SSL_About.Typeface =Font
	lbl_SSL_Panel.Typeface = Typeface.MATERIALICONS
	lbl_SSL_Panel.Gravity = Gravity.CENTER
	lbl_SSL_About.Gravity = Gravity.RIGHT
	lbl_SSL_About.TextColor=Colors.Black
	lbl_SSL_Panel.TextColor=Colors.Black
	nb.Initialize("nb")
	nb.AddHeightChangedEvent
	WebView.LoadUrl(Start_HostName_With&"/index.php?Amount="&money&"&Description="&Description&"&Email="&E_Mail&"&Mobile="&phone&"&Merchand_ID="&Merchand_ID&"&Start="&Start_HostName_With)
End Sub

Private Sub Activity_Resume

End Sub

Private Sub SetLabelTextSize(ex As Label, txt As String,good As Int)
	Dim dt As Float
	Dim limit = 0.5 As Float
	Dim h As Int
	Dim stu As StringUtils
	ex.Text = txt
	ex.TextSize = good
	dt = ex.TextSize
	h = stu.MeasureMultilineTextHeight(ex, txt)
	Do While dt > limit Or h > ex.Height
		dt = dt / 2
		h = stu.MeasureMultilineTextHeight(ex, txt)
		If h > ex.Height Then
			ex.TextSize = ex.TextSize - dt
		Else
			ex.TextSize = ex.TextSize + dt
		End If
	Loop
	ex.TextSize=ex.textsize * 0.8
End Sub

private Sub Activity_Pause (UserClosed As Boolean)

End Sub

private Sub activity_KeyPress (KeyCode As Int) As Boolean
	' this sub : for Qustion about exit (just Back Button!)
	Select KeyCode
		Case KeyCodes.KEYCODE_BACK
			Dim a As Int
			a=Msgbox2("آیا می خواهید از صفحه پرداخت خارج شوید؟"&CRLF&"خروج شما باعث لغو پرداخت می شود؟","خارج شدن از پرداخت","خارج می شوم","به پرداخت ادامه می دهم","",Null)
			If a = DialogResponse.POSITIVE Then
				Activity.Finish
			End If
			Return True
	End Select
End Sub

private Sub timer_Tick	
	ab=WebView.Url
	If WebView.Url.StartsWith("https://")=True Or WebView.Url.StartsWith("Https://")=True Then
		lbl_SSL.TextColor = Colors.Green
		lbl_SSL.Text=""
		ab=ab.Replace("https://","{R}https://{R}")
		r.Initialize(ab)
		r.Color2(Colors.Green,"{R}")
	Else
		lbl_SSL.TextColor = Colors.Red
		lbl_SSL.Text=""
		ab=ab.Replace("www.","{R}www.{R}")
		ab=ab.Replace("http://","{R}http://{R}")
		r.Initialize(ab)
		r.Color2(Colors.Red,"{R}")
	End If

	lbl_Address.Text =r
	If lbl_Address.Text.StartsWith("zarinpal://otpAuthorize")=True And  bool = True Then
		ToastMessageShow("نمی توان از اپیکیشن زرین پال برای پرداخت استفاده کرد!",True)
		WebView.Back
		bool = False
	else If lbl_Address.Text.StartsWith("zarinpal://otpAuthorize")=False And bool = False Then
		bool = True
	End If
End Sub

private Sub timer_OK_Tick
	If WebView.Url.StartsWith(Start_HostName_With&"/verify.php") Then
		WebView.Visible=False
		Log("تراکنش انجام شد")
		ProgressDialogShow2("در حال برسی وضعیت تراکنش...",False)
		timer_OK.Enabled=False
		htt.Initialize("htt",Me)
		htt.Download(WebView.Url)
	End If
End Sub

private Sub JobDone(job As HttpJob)
	Log(job.GetString)
'	ToastMessageShow(job.GetString,True)
	If job.Success Then
		If job.JobName="htt" Then
			Dim jp As JSONParser
			jp.Initialize(job.GetString)
			Dim l1 As List = jp.NextArray
			Dim l21 As Map = l1.Get(0)
			ProgressDialogHide
			Dim Statuss As String=l21.Get("Status")
			Dim Kod_Tarakoneshs As String =l21.Get("Kod_Tarakonesh")
			If l21.Get("Status") = "null" Then
				Statuss="21"
				Kod_Tarakoneshs = "0"
			End If
'			Dim tozihat As String
'			Select l21.Get("Status")
				'اگر null بده تراکنش لغو شده
'				Case "1"
'					tozihat = "اطلاعات ارسال شده ناقص است"
'				Case "2"
'					tozihat = "و يا مرچنت كد پذيرنده صحيح نيست IP"
'				Case "3"
'					tozihat = "با توجه به محدوديت هاي شاپرک امكان پرداخت با رقم درخواست شده ميسر نمي باشد"
'				Case "4"
'					tozihat = "سطح تاييد پذيرنده پايين تر از سطح نقره اي است"
'				Case "11"
'					tozihat = "درخواست مورد نظر يافت نشد"
'				Case "12"
'					tozihat = "امكان ويرايش درخواست ميسر نمي باشد"
'				Case "21"
'					tozihat = "هيچ نوع عمليات مالي براي اين تراكنش يافت نشد"
'				Case "22"
'					tozihat = "تراكنش ناموفق ميباشد"
'				Case "33"
'					tozihat = "رقم تراكنش با رقم پرداخت شده مطابقت ندارد"
'				Case "34"
'					tozihat = "سقف تقسيم تراكنش از لحاظ تعداد يا رقم عبور نموده است"
'				Case "40"
'					tozihat = "اجازه دسترسي به متد مربوطه وجود ندارد"
'				Case "41"
'					tozihat = "غيرمعتبر ميباشد AdditionalData اطلاعات ارسال شده مربوط به"
'				Case "42"
'					tozihat = "مدت زمان معتبر طول عمر شناسه پرداخت بايد بين 30 دقيقه تا 45 روز مي باشد"
'				Case "54"
'					tozihat = "درخواست مورد نظر آرشيو شده است"
'				Case "100"
'					tozihat = "عمليات با موفقيت انجام گرديده است."
'				Case "101"
'					tozihat = "تراكنش انجام شده است PaymentVerification عمليات پرداخت موفق بوده و قبلا"
'				Case Else
'					tozihat = "نتیجه ای از سمت درگاه دریافت نشد"
'			End Select
'			ProgressDialogShow2(tozihat,False)
'			ToastMessageShow(tozihat,True)
			CallSubDelayed3(Activity_Now,"Zarin_Pal_Request",Statuss,Kod_Tarakoneshs)
			Activity.Finish
			ProgressDialogHide
		End If
	End If
End Sub

Sub nb_HeightChanged(NewHeight As Int, OldHeight As Int)
	If NewHeight < OldHeight Then
		WebView.Height =  NewHeight - 10%y
	Else If NewHeight > OldHeight Then
		WebView.Height=90%y
	End If
End Sub

Private Sub lbl_SSL_Click
	If pnl.Visible = False Then
		pnl.Visible=True
		If WebView.Url.StartsWith("https://")=True Or WebView.Url.StartsWith("Https://")=True Then
			lbl_SSL_Panel.TextColor = Colors.Green
			SetLabelTextSize(lbl_SSL_Panel,"",50)
		Else
			lbl_SSL_Panel.TextColor = Colors.Red
			SetLabelTextSize(lbl_SSL_Panel,"",50)
		End If
		If WebView.Url.Contains("shaparak.ir") =True Then
			If WebView.Url.StartsWith("https://")=True Or WebView.Url.StartsWith("Https://")=True Then
				SetLabelTextSize(lbl_SSL_About,"اتصال امن است!"& CRLF & "اطلاعات پرداخت شما هنگامی که به این سایت ارسال می شود خصوصی است."&CRLF&"شما در سایت شاپرک هستید!",15)
			Else
				SetLabelTextSize(lbl_SSL_About,"اتصال شما به این سایت امن نیست!"& CRLF & "شما نباید هیچ اطلاعات حساس در این سایت وارد کنید." & CRLF &"زیرا می تواند توسط مهاجمان مورد سرقت قرار گیرد."&CRLF&"شما در سایت شاپرک هستید!",15)
			End If
		Else
			If WebView.Url.StartsWith("https://")=True Or WebView.Url.StartsWith("Https://")=True Then
				SetLabelTextSize(lbl_SSL_About,"اتصال امن است!"& CRLF & "اطلاعات پرداخت شما هنگامی که به این سایت ارسال می شود خصوصی است.",15)
			Else
				SetLabelTextSize(lbl_SSL_About,"اتصال شما به این سایت امن نیست!"& CRLF & "شما نباید هیچ اطلاعات حساس در این سایت وارد کنید." & CRLF &"زیرا می تواند توسط مهاجمان مورد سرقت قرار گیرد.",15)
			End If
		End If	
	Else if pnl.Visible = True Then
		pnl.Visible=False
	End If
End Sub

private Sub lbl_SSL_About_Click
	pnl.Visible=False
End Sub

private Sub lbl_SSL_Panel_Click
	pnl.Visible=False
End Sub