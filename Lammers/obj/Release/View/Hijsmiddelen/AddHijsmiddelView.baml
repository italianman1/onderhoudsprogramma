   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  1    +Lammers.View.Hijsmiddelen.AddHijsmiddelView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     9local'clr-namespace:Lammers.View.Hijsmiddelen     $	��390��$	��350��  � DataContext  �� *AddHijsmiddel+   Locator �� Source# [  .��� .+��� -    ��Name$ label��$��Voeg een hijsmiddel toe��$��Arial)�$��20(�$
��Left=�$��60,0,0,0q�$	��Top=��� -   $ label1��$��Soort hijsmiddel:��$
��Left=�$��	24,33,0,0q�$	��Top=��� -    ��Name$ comboBox�� �� SelectedIndex$ 0��$
��Left=�$��
154,36,0,0q�$	��Top=�$	��128�� �� SelectedItem ��  �� Path$ SelectedSoort����� *	Soorten+�� -   $ label2��$��Datum gekeurd��$
��Left=�$��	24,69,0,0q�$	��Top=��� -   $ label3��$��Datum herkeuring��$
��Left=�$��
24,106,0,0q�$	��Top=��� -    ��Name$ textBox��$
��Left=�$��23��$��154,145,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��128������ *Registratienummer+�� -   $ label4��$��Registratienummer��$
��Left=�$��
21,142,0,0q�$	��Top=��� -   $ label5��$��Certificaatnummer��$
��Left=�$��
21,185,0,0q�$	��Top=��� -	   $ textBox1��$
��Left=�$��23��$��154,188,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Certificaatnummer+�� -
   $ label6��$��Status��$
��Left=�$��
21,233,0,0q�$	��Top=��� -   $ 	comboBox1��$
��Left=�$��154,237,0,0q�$	��Top=�$	��128������ *Stats+ �� *SelectedStat+(  "System.Windows.Controls.DatePicker  $
��Left=�$��
154,69,0,0q�$	��Top=�$	��128��	   SelectedDate	 �� *Keuringdatum+  $
��Left=�$��154,108,0,0q�$	��Top=�$	��128��	 �� *Herkeuringsdatum+�� -   
 ��Name$
 button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -   $
 button1��$��Maak hijsmiddel aan��$
��Left=�$��162,358,0,0q�$	��Top=�$	��128�� J� RenderTransformOrigin$ 0.504,0.158&����� *AddHijsmiddel+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��36��$��
10,344,0,0q�$	��Top=�$��73���� -   $ label7��$��Ligt het bij Stevens?��$
��Left=�$��
21,271,0,0q�$	��Top=��� $��Stevens Lasconstructie��$
��Left=�$��154,277,0,0q�$	��Top=�$	��147�� d� 	IsChecked �� *	Stevens+�� $
��Left=�$��154,319,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
24,308,0,0q�$	��Top=�