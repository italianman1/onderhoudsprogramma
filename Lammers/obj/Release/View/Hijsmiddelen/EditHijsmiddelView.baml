   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  2    ,Lammers.View.Hijsmiddelen.EditHijsmiddelView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     9local'clr-namespace:Lammers.View.Hijsmiddelen     $	��390��$��336.647��  � DataContext  �� *EditHijsmiddel+   Locator �� Source# [  .��� .+��� -    ��Name$ label��$��Wijzig hijsmiddel ��$��Arial)�$��20(�$
��Left=�$��	81,-2,0,0q�$	��Top=��� -   $ label1��$��Soort hijsmiddel:��$
��Left=�$��
24,136,0,0q�$	��Top=��� -    ��Name$ comboBox��$
��Left=�$��154,136,0,0q�$	��Top=�$	��128�� �� SelectedItem ��  �� Path$ SelectedSoort����� *	Soorten+�� -   $ label2��$��Datum gekeurd��$
��Left=�$��	24,52,0,0q�$	��Top=��� -   $ label3��$��Datum herkeuring��$
��Left=�$��	26,95,0,0q�$	��Top=��� -    ��Name$ textBox��$
��Left=�$��23��$��154,173,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��128������ *Registratienummer+�� -   $ label4��$��Registratienummer��$
��Left=�$��
21,170,0,0q�$	��Top=��� -   $ label5��$��Certificaatnummer��$
��Left=�$��
21,206,0,0q�$	��Top=��� -	   $ textBox1��$
��Left=�$��23��$��154,207,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Certificaatnummer+�� -
   $ label6��$��Status��$
��Left=�$��
21,245,0,0q�$	��Top=��� -   $ 	comboBox1��$
��Left=�$��154,248,0,0q�$	��Top=�$	��128������ *Stats+ �� *SelectedStat+(  "System.Windows.Controls.DatePicker  $
��Left=�$��
154,54,0,0q�$	��Top=�$	��128��   SelectedDate �� *Keuringdatum+  $
��Left=�$��
154,97,0,0q�$	��Top=�$	��128�� �� *Herkeuringsdatum+�� -   	 ��Name$	 button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -   
 ��Name$
 image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -   $	 button1��$��Wijzig hijsmiddel��$
��Left=�$��154,349,0,0q�$	��Top=�$	��128������ *EditHijsmiddel+�� -   $
 image1��$��/Images/lammers_logo.jpg��$
��Left=�$��40��$��
21,340,0,0q�$	��Top=�$��70���� -   $ label7��$��Ligt het bij Stevens?��$
��Left=�$��
21,278,0,0q�$	��Top=��� $��Stevens Lasconstructie��$
��Left=�$��154,283,0,0q�$	��Top=�$	��147�� d� 	IsChecked �� *	Stevens+�� $
��Left=�$��154,319,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
21,309,0,0q�$	��Top=�