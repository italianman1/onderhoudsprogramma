   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Lammers.View.ValbeveiligingLammers.View.Valbeveiliging  7    1Lammers.View.Valbeveiliging.AddValbeveiligingView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:Lammers.View.Valbeveiliging     $��423.768��$��319.336��  � DataContext  �� *AddValbeveiliging+   Locator �� Source# [  .���  � ColumnDefinitions �� �� $��0* �.+��� -    ��Name$ label��$��Voeg valbeveiliging toe��$��Arial)�$��20(�$
��Left=�$��60,1,0,0q�$	��Top=��� -   $ label2��$��Datum gekeurd��$
��Left=�$��	45,44,0,0q�$	��Top=�$��31��$��95���� -   $ label3��$��Datum herkeuring��$
��Left=�$��	45,88,0,0q�$	��Top=�$��33��$	��108���� -   $ label4��$��Omschrijving:��$
��Left=�$��
42,133,0,0q�$	��Top=�$��31��$	��115���� -   $ label5��$��Opdrachtnummer��$
��Left=�$��
42,185,0,0q�$	��Top=�$��33��$	��111���� -    ��Name$ textBox1��$
��Left=�$��29��$��179,189,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��131������ *Opdrachtnummer+(  "System.Windows.Controls.DatePicker  $
��Left=�$��
179,44,0,0q�$	��Top=�$	��131��$��28��   SelectedDate �� *Keuringdatum+  $
��Left=�$��
179,91,0,0q�$	��Top=�$	��131��$��30�� �� *Herkeuringsdatum+�� -    ��Name$ button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -	   $ button1��$��Maak valbeveiliging aan��$
��Left=�$��168,392,0,0q�$	��Top=�$	��142������ *AddValbeveiliging+�� -
   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��36��$��
32,378,0,0q�$	��Top=�$��73���� -   $ label6_Copy��$��Certificaatnummer��$
��Left=�$��
42,232,0,0q�$	��Top=�$��33��$	��111���� -   $ label6_Copy1��$��Serienummer��$
��Left=�$��
42,270,0,0q�$	��Top=�$��33��$��98���� -   $ textBox_Copy��$
��Left=�$��27��$��179,232,0,0q�$
 Wrap=�$	��Top=�$	��131������ *Certificaatnummer+�� -   $ textBox_Copy1��$
��Left=�$��27��$��179,270,0,0q�$
 Wrap=�$	��Top=�$	��131������ *Serienummer+�� -   	 ��Name$	 	comboBox2��
 �� SelectedIndex$
 0��$
��Left=�$��181,137,0,0q�$	��Top=�$	��129�� �� SelectedItem �� *SelectedOmschrijving+���� *Omschrijvingen+�� -   $	 	comboBox3��$
 0��$
��Left=�$��179,315,0,0q�$	��Top=�$	��129�� �� *SelectedPersoon+���� *
Personen+�� -   $ label6��$��Behoort toe aan:��$
��Left=�$��
42,311,0,0q�$	��Top=� J� RenderTransformOrigin$ -0.166,0.467&��� $
��Left=�$��179,357,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
45,347,0,0q�$	��Top=�