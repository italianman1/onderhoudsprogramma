   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:Lammers.View.OpleggersLammers.View.Opleggers  -    'Lammers.View.Opleggers.EditOpleggerView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6local$clr-namespace:Lammers.View.Opleggers     $��295.73��$��468.577��  � DataContext  �� *EditOplegger+   Locator �� Source# [  .��� .+��� -    ��Name$ label��$��Wijzig gegevens oplegger��$��Arial)�$��20(�$
��Left=�$��49,0,0,0q�$	��Top=��� -   $ label2��$��Datum gekeurd��$
��Left=�$��	25,94,0,0q�$	��Top=��� -   $ label3��$��Datum herkeuring��$
��Left=�$��
25,131,0,0q�$	��Top=��� -    ��Name$ textBox��$
��Left=�$��23��$��154,170,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��128������ *
Codenummer+�� -   $ label4��$��Code nummer��$
��Left=�$��
26,167,0,0q�$	��Top=��� -   $ label5��$��Kenteken��$
��Left=�$��
27,210,0,0q�$	��Top=��� -   $ textBox1��$
��Left=�$��23��$��154,213,0,0q�$
 Wrap=�$	��Top=�$	��128������ *
Kenteken+(  "System.Windows.Controls.DatePicker  $
��Left=�$��
154,94,0,0q�$	��Top=�$	��128��   SelectedDate �� *Keuringdatum+  $
��Left=�$��154,133,0,0q�$	��Top=�$	��128�� �� *Herkeuringsdatum+�� -    ��Name$ button2��$
��Left=�$��4,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -	    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -
   $ button1��$��Wijzig oplegger��$��154,425,14,10q����� *EditOplegger+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��39��$��
25,425,0,0q�$	��Top=�$��73���� -   $ label6��$��Leverancier��$
��Left=�$��
27,248,0,0q�$	��Top=� J� RenderTransformOrigin$ -0.053,-0.508&��� -   $ textBox2��$
��Left=�$��23��$��154,251,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Leverancier+�� -   $ label1��$��Benaming��$
��Left=�$��	24,52,0,0q�$	��Top=��� -   $ textBox3��$
��Left=�$��23��$��
154,54,0,0q�$
 Wrap=�$	��Top=�$	��128������ *
Benaming+�� -   $ label7��$��Bouwjaar��$
��Left=�$��
26,289,0,0q�$	��Top=��� -   $ textBox4��$
��Left=�$��23��$��154,292,0,0q�$
 Wrap=�$	��Top=�$	��128������ *
Bouwjaar+�� -   $ label8��$��Locatie��$
��Left=�$��
27,326,0,0q�$	��Top=��� -   $ textBox5��$
��Left=�$��23��$��154,328,0,0q�$
 Wrap=�$	��Top=�$	��128������ *	Locatie+�� $
��Left=�$��154,400,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
27,394,0,0q�$	��Top=��� -   $ label9��$��Status��$
��Left=�$��
27,356,0,0q�$	��Top=�$ 1.631,1.583&��� -   	 ��Name$	 	comboBox1��$
��Left=�$��154,359,0,0q�$	��Top=�$	��128������ *Stats+
 �� SelectedItem
 �� *SelectedStat+