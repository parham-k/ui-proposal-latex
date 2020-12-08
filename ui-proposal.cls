\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ui-proposal}[2020/12/02 University of Isfahan Research Proposal Template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass[a4paper,11pt]{article}

\RequirePackage{float}
\RequirePackage[top=1cm,bottom=1.75cm,left=1cm,right=1cm]{geometry}
\RequirePackage[table]{xcolor}
\RequirePackage{pgf}
\RequirePackage{pgfpages}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage[manualmark]{scrlayer-scrpage}[2015/10/03]
\RequirePackage{tikz}
\RequirePackage{multirow}
\RequirePackage{sectsty}
\RequirePackage{mdframed}
\RequirePackage{amssymb}
\RequirePackage[localise=on]{xepersian}

\clearpairofpagestyles
\cofoot*{\thepage}

\DeclareNewLayer[
background,
voffset=.2in+.75pt,
hoffset=.2in-.75pt,
addwidth=-.4in-1.5pt,
addheight=-.8in-1.5pt,
mode=picture,
contents={\putLL{%
		\setlength\fboxrule{1pt}\setlength\fboxsep{0pt}%
		\fbox{\parbox[b][\layerheight]{\layerwidth}{\mbox{}}}%
}}]{frame}

\AddLayersToPageStyle{@everystyle@}{frame}

\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\renewcommand{\arraystretch}{1.5}
\renewcommand{\thesubsection}{\arabic{section}-\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}-\arabic{subsection}-\arabic{subsubsection}}
\renewcommand{\labelitemi}{-}

\linespread{1.25}
\setlatintextfont{Times New Roman}
\sectionfont{\fontsize{13}{15}\selectfont}
\subsectionfont{\fontsize{11}{15}\selectfont}
\subsubsectionfont{\fontsize{10}{15}\selectfont}

\newif\if@bsc
\@bscfalse
\DeclareOption{bsc}{\@bsctrue}
\newif\if@msc
\@mscfalse
\DeclareOption{msc}{\@msctrue}
\newif\if@phd
\@phdfalse
\DeclareOption{phd}{\@phdtrue}
\ProcessOptions

\def\رشته#1{\gdef\@رشته{#1}}
\def\گرایش#1{\gdef\@گرایش{#1}}
\def\دانشکده#1{\gdef\@دانشکده{#1}}
\def\عنوان‌انگلیسی#1{\gdef\@عنوان‌انگلیسی{#1}}\def\شماره‌دانشجویی#1{\gdef\@شماره‌دانشجویی{#1}}
\def\استادان#1{\gdef\@استادان{#1}}
\def\شماره‌همانندجویی‌ایران‌داک#1{\gdef\@شماره‌همانندجویی‌ایران‌داک{#1}}
\def\شماره‌ثبت‌نهایی‌ایران‌داک#1{\gdef\@شماره‌ثبت‌نهایی‌ایران‌داک{#1}}
\def\تاریخ‌همانندجویی‌ایران‌داک#1{\gdef\@تاریخ‌همانندجویی‌ایران‌داک{#1}}
\def\تاریخ‌ثبت‌نهایی‌ایران‌داک#1{\gdef\@تاریخ‌ثبت‌نهایی‌ایران‌داک{#1}}
\def\کدمأموریت‌استاد#1{\gdef\@کدمأموریت‌استاد{#1}}
\def\عنوان‌مأموریت‌استاد#1{\gdef\@عنوان‌مأموریت‌استاد{#1}}
\def\سازمان‌حمایت‌کننده#1{\gdef\@سازمان‌حمایت‌کننده{#1}}
\def\حمایت#1{\gdef\@حمایت{#1}}

\newif\if@ethics \@ethicsfalse
\newif\if@fundemental \@fundementalfalse
\newif\if@development \@developmentfalse
\newif\if@applied \@appliedfalse

\newcommand{\نیازبه‌شناسه‌اخلاق}{\@ethicstrue}
\newcommand{\بنیادی}{\@fundementaltrue}
\newcommand{\توسعه‌ای}{\@developmenttrue}
\newcommand{\کاربردی}{\@appliedtrue}

\newcommand{\checkarg}[1]{
	\def\temp{#1}\ifx\temp\empty
	$\square$%
	\else
	$\blacksquare$%
	\fi
}

\newcommand{\کلیدواژه}[2]{\therowcount- #1 \hfill \lr{\therowcount- #2} \stepcounter{rowcount} \smallskip \\}

\newcommand{\مشخصات}{
	
	\begin{tikzpicture}[remember picture,overlay]
		\node[anchor=north west,yshift=-0.5cm,xshift=0.5cm] at (current page.north west)
		{\includegraphics[height=3cm]{ui}};
	\end{tikzpicture}

	\begin{center}
	\textbf{بسمه تعالی} \\ ~\bigskip \\ \bigskip
	\large\textbf{
	\if@bsc			پیشنهاده‌ی پروژه‌ی کارشناسی
	\fi\if@msc			پیشنهاده‌ی پایان‌نامه‌ی کارشناسی ارشد
	\fi\if@phd			پیشنهاده‌ی رساله‌ی دکتری
	\fi
	رشته‌ی \@گرایش~دانشکده‌ی \@دانشکده
		} \\
	\end{center} \medskip
	
	\section{عنوان پژوهش}		
	\begin{table}[H]
		\begin{tabularx}{\linewidth}{|r|X|}
			\hline
			\cellcolor{gray!25}\textbf{۱- فارسی:} & \@title \\ \hline
			\cellcolor{gray!25}\textbf{۲- انگلیسی:} & \lr{\@عنوان‌انگلیسی} \\
			\hline
		\end{tabularx}
	\end{table}

	\section{مشخصات دانشجو}
	\begin{table}[H]
		\begin{tabularx}{\linewidth}{|c|c|c|C|}
			\hline
			\rowcolor{gray!25} 
				\textbf{نام و نام خانوادگی} 
				& \textbf{شماره دانشجویی}	
				& \textbf{رشته و گرایش}	
				& \textbf{امضا}
			 \\ \hline
			 \multirow{2}{*}{\@author}	  
			 & \multirow{2}{*}{\@شماره‌دانشجویی} 
			 &  \multirow{2}{*}{\@رشته - \@گرایش} 
			 & \multirow{2}{*}{} \\ 
			 & & & \\ \hline
		\end{tabularx}
	\end{table}

	\section{مشخصات استادان راهنما و مشاور}
	\begin{table}[H]
		\begin{tabularx}{\linewidth}{|c|P{4cm}|P{4cm}|c|C|}
			\hline
			\rowcolor{gray!25} 
			\textbf{نام و نام خانوادگی} 
			& \textbf{دانشگاه و گروه آموزشی / سایر مؤسسات}	
			& \textbf{تخصص}	
			& \textbf{راهنما یا مشاور}	
			& \textbf{امضا}
			\\ \hline
			\@استادان
			\\ \hline
		\end{tabularx}
	\end{table}

		
	\section{ثبت پیشنهاده در ایران‌داک}
	\begin{table}[H]
		\centering
		\begin{tabular}{|c|c|c|}
			\hline \rowcolor{gray!25} 
	\متن‌سیاه{نوع ثبت} & \متن‌سیاه{شماره‌ی نامه‌ی گواهی ثبت} & \متن‌سیاه{تاریخ نامه‌ی گواهی ثبت} \\ \خط‌پر
	\متن‌سیاه{همانندجویی} & \@شماره‌همانندجویی‌ایران‌داک & \@تاریخ‌همانندجویی‌ایران‌داک \\ \خط‌پر
	\متن‌سیاه{ثبت نهایی} & \@شماره‌ثبت‌نهایی‌ایران‌داک & \@تاریخ‌ثبت‌نهایی‌ایران‌داک \\ \خط‌پر
		\end{tabular}
	\end{table}
	
	\newpage
	
	\section{هدفمندسازی پایان‌نامه و رساله}
	\begin{table}[H]
		\centering
		\begin{tabular}{|c|c|}
			\hline \rowcolor{gray!25} 
			\متن‌سیاه{کد مأموریت پژوهشی استاد راهنما} & \متن‌سیاه{عنوان مأموریت پژوهشی استاد راهنما} \\ \خط‌پر
			\@کدمأموریت‌استاد & \@عنوان‌مأموریت‌استاد \\ \خط‌پر
	\rowcolor{gray!25} 
\متن‌سیاه{سازمان حمایت‌کننده} & \متن‌سیاه{نوع حمایت یا شماره و مبلغ قرارداد} \\ \خط‌پر
			\@سازمان‌حمایت‌کننده & \@حمایت \\ \خط‌پر
		\end{tabular}
	\end{table}
	
	\section{شناسه اخلاق در پژوهش}
	در صورت نیاز به شناسه اخلاق، بلافاصله پس از تصویب پیشنهاده در گروه، اقدام شود.

	\begin{tabularx}{\linewidth}{cc}
		نیاز دارد 
		\if@ethics $\blacksquare$ \else $\square$ \fi
		 & نیاز ندارد
		 \if@ethics $\square$ \else $\blacksquare$ \fi
	\end{tabularx}
	
	\section{نوع پژوهش}
	\begin{tabularx}{\linewidth}{ccc}
		بنیادی
		 \if@fundemental $\blacksquare$ \else $\square$ \fi
		 & توسعه‌ای
		 \if@development $\blacksquare$ \else $\square$ \fi
		 & کاربردی
		 \if@applied $\blacksquare$ \else $\square$ \fi
	\end{tabularx}

}

\newenvironment{کلیدواژه‌ها}{
	\section{کلیدواژه‌ها}
	در صورت نیاز، واژه‌ها تعریف و ارجاع‌دهی شوند. 
	
	\newcounter{rowcount}
	\setcounter{rowcount}{1}
	\medskip \noindent
		{\درشت \متن‌سیاه{فارسی} \hfill \متن‌سیاه{انگلیسی}} \medskip \\
}{\pagebreak}

\newenvironment{مسئله}{
	\section{مسئله‌ی پژوهش}
	مسئله‌ی اصلی پژوهش به صورت صریح بیان می‌شود و اهمیت، زمینه‌ی بروز و ابعاد ذکر می‌شود.
	\begin{mdframed}
}{\end{mdframed}}

\newenvironment{پیشینه}{
	\section{پیشینه‌ی پژوهش}
	تحقیقاتی که تا کنون در ارتباط با مسئله‌ی این پژوهش، توسط پژوهشگران دیگر، در مراجع معتبر علمی منتشر شده است، به تفصیل ارائه و نقد می‌شود.
	\begin{mdframed}
}{\end{mdframed}}

\newenvironment{فرضیه‌ها}{
	\section{فرضیه‌ها یا سؤال‌های پژوهش}
	در این بخش، بر اساس مطالعات پیشینه و تحلیل مسئله، فرضیه‌هایی که باید در این پژوهش اثبات شوند یا سؤال‌هایی که باید پاسخ داده شوند، جمع‌بندی و به صورت صریح بیان می‌شوند.
	\begin{mdframed}
}{\end{mdframed}}

\newenvironment{اهداف}{
	\section{اهداف پژوهش}
	\begin{mdframed}
}{\end{mdframed}}

\newenvironment{دستاوردها}[5]{
	\section{پیش‌بینی دستاوردها}
	دانشجویان دکتری در تکمیل جدول باید شیوه نامه‌ی ارزیابی کفایت بروندادهای رساله‌ی دکتری دانشگاه را مد نظر قرار دهند.
	
	\begin{tabularx}{\linewidth}{|rc|X|}
			\hline
			رفع نیازهای ملی & \checkarg{#1} & \متن‌سیاه{آدرس موضوع در اسناد بالادستی ملی یا در سازمان‌های مرتبط:} #1 \\
			انتشارات علمی & \checkarg{#2} & \متن‌سیاه{نوع (مقاله، گزارش فنی، کتاب) و محل ارائه:} #2 \\
			ثبت اختراع & \checkarg{#3} & \متن‌سیاه{محل ثبت اختراع:} #3 \\
			تولید محصول و تجاری‌سازی & \checkarg{#4} & \متن‌سیاه{محل ارائه و مشتریان احتمالی:} #4 \\
			سایر & \checkarg{#5} & \متن‌سیاه{توضیحات:} #5 \\ 
		\end{tabularx}\vspace{-10pt}\begin{mdframed}
		\متن‌سیاه{بیان نوآوری اصلی تحقیق در یک یا دو جمله:}
}{\end{mdframed}}

\newenvironment{روش}{
	\section{روش پژوهش}
	روش انجام این پژوهش از نظر ورودی‌ها، نحوه‌ی تجزیه و تحلیل، روش بررسی نتایج و پاسخ به مسئله‌ی پژوهش، با جزئیات لازم مطابق نظر دانشکده توضیح داده می‌شود و در صورت نیاز، با نمودار ترسیمی و جدول زمانی کامل خواهد شد. در طول انجام پژوهش، اگر تغییری در این بخش لازم بود، دانشکده در مورد آن تصمیم‌گیری خواهد کرد.
	\begin{mdframed}
}{\end{mdframed}}

\newcommand{\منشور}{
	\pagebreak
	\begin{center}
		\textbf{به نام خدا} \\ \medskip
			\begin{figure}[H]
			\centering
			\includegraphics[width=1cm]{msrt}
		\end{figure}
		\large\textbf{وزارت علوم، تحقیقات و فناوری} \\
		\textbf{معاونت پژوهش و فناوری} \\ \bigskip
		\LARGE\textbf{منشور اخلاق پژوهش}
	\end{center}

\bigskip

\پاراگراف{} با استعانت از خدای سبحان و با اعتقاد راسخ به اینکه عالم محضر خداست و او همواره ناظر بر اعمال ماست و به منظور انجام شایسته‌ی پژوهش‌های اصیل، تولید دانش جدید و بهسازی زندگانی بشر، ما دانشجویان و اعضای هیأت علمی دانشگاه‌ها و پژوهشگاه‌های کشور:
\شروع{فقرات}
\فقره{تمام تلاش خود را برای کشف حقیقت و فقط حقیقت به کار خواهیم بست و از هر گونه جعل و تحریف در فعالیت‌های علمی پرهیز می‌کنیم.}
\فقره{حقوق پژوهشگران، پژوهیدگان (انسان، حیوان، گیاه و اشیاء)، سازمان‌ها و سایر صاحبان حقوق را به رسمیت می‌شناسیم و در حفظ آن می‌کوشیم.}
\فقره{به مالکیت مادی و معنوی آثار پژوهشی ارج می‌نهیم، برای انجام پژوهشی اصیل اهتمام ورزیده از سرقت علمی و ارجاع نامناسب اجتناب می‌کنیم.}
\فقره{ضمن پایبندی به انصاف و اجتناب از هر گونه تبعیض و تعصب، در کلیه‌ی فعالیت‌های پژوهشی رهیافتی نقادانه اتخاذ خواهیم کرد.}
\فقره{ضمن امانت‌داری، از منابع و امکانات اقتصادی، انسانی و فنی موجود استفاده بهره‌ورانه خواهیم کرد.}
\فقره{از انتشار غیراخلاقی نتایج پژوهش نظیر انتشار موازی همپوشان و چندگانه (تکه‌ای) پرهیز می‌کنیم.}
\فقره{اصل محرمانه بودن و رازداری را محور تمام فعالیت‌های پژوهشی خود قرار می‌دهیم.}
\فقره{در همه فعالیت‌های پژوهشی به منافع ملی توجه کرده و برای تحقق آن می‌کوشیم.}
\فقره{خویش را ملزم به رعایت کلیه هنجارهای  علمی رشته خود، قوانین و مقررات، سیاست‌های حرفه‌ای، سازمانی، دولتی و راهبردهای ملی در همه مراحل پژوهش می‌دانیم.}
\فقره{رعایت اصول اخلاق در پژوهش را اقدامی فرهنگی می‌دانیم و به منظور بالندگی این فرهنگ، به ترویج و اشاعه‌ی آن درجامعه اهتمام می‌ورزیم.}
\پایان{فقرات} 

\bigskip
\begin{table}[H]
	\begin{tabularx}{\linewidth}{rC}
		امضای دانشجو & امضای استاد راهنما
	\end{tabularx}
\end{table}
	
}
