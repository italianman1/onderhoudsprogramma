   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:Lammers.View.HefmiddelenLammers.View.Hefmiddelen  0    *Lammers.View.Hefmiddelen.EditHefmiddelView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     8local&clr-namespace:Lammers.View.Hefmiddelen       � DataContext  �� *EditHefmiddel+   Locator �� Source# [  .��� $	��504�� � ColumnDefinitions �� �� $��0* �.+��� -    ��Name$ label��$��Bewerk een Hefmiddel��$��Arial)�$��20(�$
��Left=�$��60,1,0,0q�$	��Top=��� -   $ label2��$��Datum gekeurd��$
��Left=�$��	25,50,0,0q�$	��Top=�$��31��$��95���� -   $ label3��$��Datum herkeuring��$
��Left=�$��	25,94,0,0q�$	��Top=�$��33��$	��108���� -    ��Name$ textBox��$
��Left=�$��27��$��159,143,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��131������ *
LAM_nummer+�� -   $ label4��$��
LAM-nummer��$
��Left=�$��
22,139,0,0q�$	��Top=�$��31��$	��115���� -   $ label5��$��Code nummer��$
��Left=�$��
22,191,0,0q�$	��Top=�$��33��$	��111���� -   $ textBox1��$
��Left=�$��29��$��159,195,0,0q�$
 Wrap=�$	��Top=�$	��131������ *
Codenummer+�� -   $ label6��$��Bouwjaar��$
��Left=�$��
22,250,0,0q�$	��Top=�$��33��$��76��(  "System.Windows.Controls.DatePicker  $
��Left=�$��
159,50,0,0q�$	��Top=�$	��131��$��28��   SelectedDate �� *Keuringdatum+  $
��Left=�$��
159,97,0,0q�$	��Top=�$	��131��$��30�� �� *Herkeuringsdatum+�� -	    ��Name$ button2��$
��Left=�$��10,2,0,0q�$	��Top=�$��45��$��24������ *BackCommand+.���� -
    ��Name$ image��$ ��/Images/arrow-back-128.png��$��24��$��35���� -   $ button1��$��Bewerk Hefmiddel��$
��Left=�$��162,468,0,0q�$	��Top=�$	��128������ *EditHefmiddel+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��36��$��
22,460,0,0q�$	��Top=�$��73���� -   $ label6_Copy��$��Leverancier��$
��Left=�$��
22,297,0,0q�$	��Top=�$��33��$��76���� -   $ label6_Copy1��$
��Merk��$
��Left=�$��
22,335,0,0q�$	��Top=�$��33��$��76���� -   $ label6_Copy2��$��Benaming��$
��Left=�$��
22,380,0,0q�$	��Top=�$��33��$��76���� -   $ textBox_Copy��$
��Left=�$��27��$��159,297,0,0q�$
 Wrap=�$	��Top=�$	��131������ *Leverancier+�� -   $ textBox_Copy1��$
��Left=�$��27��$��159,335,0,0q�$
 Wrap=�$	��Top=�$	��131������ *Merk+�� -   $ textBox_Copy2��$
��Left=�$��27��$��159,380,0,0q�$
 Wrap=�$	��Top=�$	��131������ *
Benaming+�� -   $ textBox2��$
��Left=�$��23��$��159,250,0,0q�$
 Wrap=�$	��Top=�$	��129������ *
Bouwjaar+�� $
��Left=�$��162,415,0,0q�$	��Top=�$	��128������ *
fileText+���� *ChooseCertificate+�� $��Kies certificaat��$
��Left=�$��
22,415,0,0q�$	��Top=�