   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:Lammers.View.KranenLammers.View.Kranen  &     Lammers.View.Kranen.AddKraanView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     3local!clr-namespace:Lammers.View.Kranen     $��295.73��$��561.857��  � DataContext  �� *
AddKraan+   Locator �� Source# [  .��� $	��556��$	��Top=�.+��� -    ��Name$ label��$��Voeg een kraan toe��$��Arial)�$��20(�$
��Left=�$��60,0,0,0q�$	��Top=��� -   $ label2��$��Datum gekeurd��$
��Left=�$��	15,94,0,0q�$	��Top=��� -   $ label3��$��Datum herkeuring��$
��Left=�$��
15,131,0,0q�$	��Top=��� -    ��Name$ textBox��$
��Left=�$��23��$��154,170,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��128������ *
Codenummer+�� -   $ label4��$��Code nummer��$
��Left=�$��
16,167,0,0q�$	��Top=��� -   $ label5��$��Opdracht nummer��$
��Left=�$��
17,210,0,0q�$	��Top=��� -   $ textBox1��$
��Left=�$��23��$��154,213,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Opdrachtnummer+(  "System.Windows.Controls.DatePicker  $
��Left=�$��
154,94,0,0q�$	��Top=�$	��128��   SelectedDate �� *Keuringdatum+  $
��Left=�$��154,133,0,0q�$	��Top=�$	��128�� �� *Herkeuringsdatum+�� -    ��Name$ button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -	    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -
   $ button1��$��Maak een kraan aan��$
��Left=�$��154,523,0,0q�$	��Top=�$	��139�� J� RenderTransformOrigin$ 0.497,0&����� *
AddKraan+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��39��$��
10,506,0,0q�$	��Top=�$��73���� -   $ label6��$��Leverancier��$
��Left=�$��
17,248,0,0q�$	��Top=�$ -0.053,-0.508&��� -   $ textBox2��$
��Left=�$��23��$��154,251,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Leverancier+�� -   $ label1��$��Benaming��$
��Left=�$��	14,52,0,0q�$	��Top=��� -   $ textBox3��$
��Left=�$��23��$��
154,54,0,0q�$
 Wrap=�$	��Top=�$	��128������ *
Benaming+�� -   $ label7��$��Bouwjaar��$
��Left=�$��
16,317,0,0q�$	��Top=��� -   $ textBox4��$
��Left=�$��23��$��154,320,0,0q�$
 Wrap=�$	��Top=�$	��128������ *
Bouwjaar+�� -   $ label8��$��Locatie��$
��Left=�$��
17,380,0,0q�$	��Top=��� -   $ textBox5��$
��Left=�$��23��$��154,382,0,0q�$
 Wrap=�$	��Top=�$	��128������ *	Locatie+�� -   $ label9��$��Fabrieksnummer��$
��Left=�$��
17,421,0,0q�$	��Top=��� -   $ textBox7��$
��Left=�$��23��$��154,421,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Fabrieksnummer+�� -   $ label10��$��Hijsvermogen��$
��Left=�$��
17,461,0,0q�$	��Top=��� -   $ textBox8��$
��Left=�$��23��$��154,463,0,0q�$
 Wrap=�$	��Top=�$	��128������ *Hijsvermogen+�� -   $ label11��$��Ligt het bij Stevens?��$
��Left=�$��
18,280,0,0q�$	��Top=��� $��Stevens Lasconstructie��$
��Left=�$��154,287,-5,0q�$	��Top=�$	��147��	 d� 	IsChecked	 �� *	Stevens+�� $
��Left=�$��154,351,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
17,346,0,0q�$	��Top=�