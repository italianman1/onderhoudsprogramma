   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Lammers.View.ValbeveiligingLammers.View.Valbeveiliging  5   	   8    2Lammers.View.Valbeveiliging.EditValbeveiligingView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ;local)clr-namespace:Lammers.View.Valbeveiliging     5   	   $��424.784��5   U   $��328.32��6f     � DataContext  6	   �� *EditValbeveiliging+   Locator �� Source# [  .��5	      �  � ColumnDefinitions 5
   
   �� 5      �� 5      $��0* �6   .+�5   
   �� -   5         ��Name$ label��5      $��Pas valbeveiliging aan��6   $��Arial)�6@   $��20(�6S   $
��Left=�6a   $��60,1,0,0q�6|   $	��Top=�6�   �� 5   
   -   5        $ label2��5      $��Datum gekeurd��6    $
��Left=�68   $��	45,44,0,0q�6S   $	��Top=�6f   $��31��6~   $��95��6�   �� 5   
   -   5        $ label3��5      $��Datum herkeuring��6    $
��Left=�6;   $��	45,88,0,0q�6V   $	��Top=�6i   $��33��6�   $	��108��6�   �� 5   
   -   5        $ label4��5      $��Omschrijving:��6    $
��Left=�68   $��
42,133,0,0q�6S   $	��Top=�6g   $��31��6   $	��115��6�   �� 5   
   -   5        $ label5��5      $��Opdrachtnummer��6    $
��Left=�69   $��
42,185,0,0q�6T   $	��Top=�6h   $��33��6�   $	��111��6�   �� 5   
   -   5         ��Name$ textBox1��5      $
��Left=�6$   $��29��6?   $��179,189,0,0q�6K    �� TextWrapping$
 Wrap=�6`   $	��Top=�6�   $	��131��6�   ��6t   �� *Opdrachtnummer+6�   (  "System.Windows.Controls.DatePicker  5   
   $
��Left=�6   $��
179,44,0,0q�6V   $	��Top=�6j   $	��131��6�   $��28��6�      SelectedDate 60   �� *Keuringdatum+6�     5   
   $
��Left=�6   $��
179,91,0,0q�6Z   $	��Top=�6n   $	��131��6�   $��30��6�    60   �� *Herkeuringsdatum+6�   �� 5   
   -   5         ��Name$ button2��5      $
��Left=�6B   $��10,2,0,0q�6]   $	��Top=�6o   $��45��6�   $��24��6�   ��6"   �� *BackCommand+.��5      �� -   5         ��Name$ image��5      $ ��/Images/arrow-back-128.png��6#   $��24��6G   $��35��6S   5      �� 5   
   -	   5        $ button1��5      $��Pas valbeveiliging aan��6"   $
��Left=�6j   $��168,393,0,0q�6�   $	��Top=�6�   $	��142��6�   	 J� RenderTransformOrigin$	 0.511,1.625&�6�   ��6C   �� *EditValbeveiliging+6�   �� 5   
   -
   5        $ image1��5      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��36��6]   $��
32,379,0,0q�6i   $	��Top=�6}   $��73��6�   �� 5   
   -   5        $ label6_Copy��5      $��Certificaatnummer��6%   $
��Left=�6A   $��
42,232,0,0q�6\   $	��Top=�6p   $��33��6�   $	��111��6�   �� 5   
   -   5        $ label6_Copy1��5      $��Serienummer��6&   $
��Left=�6<   $��
42,270,0,0q�6W   $	��Top=�6k   $��33��6�   $��98��6�   �� 5   
   -   5        $ textBox_Copy��5      $
��Left=�6(   $��27��6C   $��179,232,0,0q�6O   $
 Wrap=�6d   $	��Top=�6�   $	��131��6�   ��6x   �� *Certificaatnummer+6�   �� 5   
   -   5        $ textBox_Copy1��5      $
��Left=�6)   $��27��6D   $��179,270,0,0q�6P   $
 Wrap=�6e   $	��Top=�6�   $	��131��6�   ��6y   �� *Serienummer+6�   �� 5   
   -   5        
 ��Name$
 	comboBox2��5      $
��Left=�6{   $��181,137,0,0q�6�   $	��Top=�6�   $	��129��6�    �� SelectedItem 6&   �� *SelectedOmschrijving+��6T   �� *Omschrijvingen+6�   �� 5    
   -   5        $
 	comboBox3��5       $
��Left=�6p   $��179,315,0,0q�6�   $	��Top=�6�   $	��129��6�    6&   �� *SelectedPersoon+��6O   �� *
Personen+6�   �� 5!   
   -   5        $ label6��5!      $��Behoort toe aan:��6    $
��Left=�6;   $��
42,311,0,0q�6V   $	��Top=�6j   $	 -0.166,0.467&�6�   �� 5"   
   $
��Left=�6T   $��181,358,0,0q�6o   $	��Top=�6�   $	��128��6�   ��6   �� *
fileText+��6.   �� *ChooseCertificate+6�   �� 5#   
   $��Kies certificaat��6   $
��Left=�6+   $��
42,348,0,0q�6F   $	��Top=�6Z   5$      5%      