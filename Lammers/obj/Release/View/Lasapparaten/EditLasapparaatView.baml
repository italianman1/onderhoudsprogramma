   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.LasapparatenLammers.View.Lasapparaten  3    -Lammers.View.Lasapparaten.EditLasapparaatView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     9local'clr-namespace:Lammers.View.Lasapparaten       � DataContext  �� *EditLasapparaat+   Locator �� Source# [  .��� $	��557�� � ColumnDefinitions �� �� $��0* �.+��� -    ��Name$ label��$��Bewerk een lasapparaat��$��Arial)�$��20(�$
��Left=�$��60,1,0,0q�$	��Top=��� -   $ label1��$��Locatie��$
��Left=�$��	45,47,0,0q�$	��Top=�$��31��$��73���� -    ��Name$ comboBox�� �� SelectedIndex$ 0��$
��Left=�$��
179,51,0,0q�$	��Top=�$	��131��$��26�� �� SelectedItem ��  �� Path$ SelectedLocatie����� *
Locaties+�� -   $ label2��$��Datum gekeurd��$
��Left=�$��	45,92,0,0q�$	��Top=�$��31��$��95���� -   $ label3��$��Datum herkeuring��$
��Left=�$��
45,136,0,0q�$	��Top=�$��33��$	��108���� -    ��Name$ textBox��$
��Left=�$��27��$��179,185,0,0q�	 �� TextWrapping$
	 Wrap=�$	��Top=�$	��131������ *
LAM_nummer+�� -   $ label4��$��
LAM-nummer��$
��Left=�$��
42,181,0,0q�$	��Top=�$��31��$	��115���� -   $ label5��$��Code nummer��$
��Left=�$��
42,222,0,0q�$	��Top=�$��33��$	��111���� -	   $ textBox1��$
��Left=�$��18��$��177,228,0,0q�$
	 Wrap=�$	��Top=�$	��131������ *
Codenummer+�� -
   $ label6��$��Bouwjaar��$
��Left=�$��
42,292,0,0q�$	��Top=�$��33��$��76��(  "System.Windows.Controls.DatePicker  $
��Left=�$��
179,92,0,0q�$	��Top=�$	��131��$��28��
   SelectedDate
 �� *Keuringdatum+  $
��Left=�$��179,139,0,0q�$	��Top=�$	��131��$��30��
 �� *Herkeuringsdatum+�� -    ��Name$ button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -   $ button1��$��Bewerk lasapparaat��$
��Left=�$��190,525,0,0q�$	��Top=�$	��128������ *EditLasapparaat+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��36��$��
42,511,0,0q�$	��Top=�$��73���� -   $ label6_Copy��$��Leverancier��$
��Left=�$��
42,339,0,0q�$	��Top=�$��33��$��76���� -   $ label6_Copy1��$
��Merk��$
��Left=�$��
42,377,0,0q�$	��Top=�$��33��$��76���� -   $ label6_Copy2��$��Benaming��$
��Left=�$��
42,422,0,0q�$	��Top=�$��33��$��76���� -   $ textBox_Copy��$
��Left=�$��27��$��179,339,0,0q�$
	 Wrap=�$	��Top=�$	��131������ *Leverancier+�� -   $ textBox_Copy1��$
��Left=�$��27��$��179,377,0,0q�$
	 Wrap=�$	��Top=�$	��131������ *Merk+�� -   $ textBox_Copy2��$
��Left=�$��27��$��179,422,0,0q�$
	 Wrap=�$	��Top=�$	��131������ *
Benaming+�� -   $ textBox2��$
��Left=�$��23��$��179,292,0,0q�$
	 Wrap=�$	��Top=�$	��129������ *
Bouwjaar+�� $
��Left=�$��182,490,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
42,480,0,0q�$	��Top=��� -   $ label7��$��Ligt het bij Stevens?��$
��Left=�$��
42,258,0,0q�$	��Top=��� $��Stevens Lasconstructie��$
��Left=�$��179,264,0,0q�$	��Top=�$	��147�� d� 	IsChecked �� *	Stevens+