   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  5   	   1    +Lammers.View.Hijsmiddelen.AddHijsmiddelView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:Lammers.View.Hijsmiddelen     5   	   $	��390��5   Q   $	��350��6^     � DataContext  6
   �� *AddHijsmiddel+   Locator �� Source# [  .��5	      � .+�5
   
   �� -   5         ��Name$ label��5
      $��Voeg een hijsmiddel toe��6   $��Arial)�6A   $��20(�6T   $
��Left=�6b   $��60,0,0,0q�6}   $	��Top=�6�   �� 5   
   -   5        $ label1��5      $��Soort hijsmiddel:��6    $
��Left=�6<   $��	24,33,0,0q�6W   $	��Top=�6j   �� 5   
   -   5         ��Name$ comboBox��5       �� SelectedIndex$ 0��6%   $
��Left=�5   U   $��
154,36,0,0q�6p   $	��Top=�6�   $	��128��6�    �� SelectedItem 6	   ��  �� Path$ SelectedSoort���65   �� *	Soorten+6�   �� 5   
   -   5        $ label2��5      $��Datum gekeurd��6    $
��Left=�68   $��	24,69,0,0q�6S   $	��Top=�6f   �� 5   
   -   5        $ label3��5      $��Datum herkeuring��6    $
��Left=�6;   $��
24,106,0,0q�6V   $	��Top=�6j   �� 5   
   -   5         ��Name$ textBox��5      $
��Left=�6#   $��23��6>   $��154,145,0,0q�6J    �� TextWrapping$
 Wrap=�6_   $	��Top=�6�   $	��128��6�   ��6s   �� *Registratienummer+6�   �� 5   
   -   5        $ label4��5      $��Registratienummer��6    $
��Left=�6<   $��
21,142,0,0q�6W   $	��Top=�6k   �� 5   
   -   5        $ label5��5      $��Certificaatnummer��6    $
��Left=�6<   $��
21,185,0,0q�6W   $	��Top=�6k   �� 5   
   -	   5        $ textBox1��5      $
��Left=�6$   $��23��6?   $��154,188,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *Certificaatnummer+6�   �� 5   
   -
   5        $ label6��5      $��Status��6    $
��Left=�61   $��
21,233,0,0q�6L   $	��Top=�6`   �� 5   
   -   5        $ 	comboBox1��5      $
��Left=�6j   $��154,237,0,0q�6�   $	��Top=�6�   $	��128��6�   ��6&   �� *Stats+ 6D   �� *SelectedStat+6�   (  "System.Windows.Controls.DatePicker  5   
   $
��Left=�6   $��
154,69,0,0q�6V   $	��Top=�6j   $	��128��6�   	   SelectedDate	 60   �� *Keuringdatum+6�     5   
   $
��Left=�6   $��154,108,0,0q�6Z   $	��Top=�6o   $	��128��6�   	 60   �� *Herkeuringsdatum+6�   �� 5   
   -   5        
 ��Name$
 button2��5      $
��Left=�6B   $��10,2,0,0q�6]   $	��Top=�6o   $��45��6�   $��24��6�   ��6"   �� *BackCommand+.��5      �� -   5         ��Name$ image��5      $ ��/Images/arrow-back-128.png��6#   $��24��6G   $��35��6S   5      �� 5   
   -   5        $
 button1��5      $��Maak hijsmiddel aan��6"   $
��Left=�6b   $��162,358,0,0q�6}   $	��Top=�6�   $	��128��6�    J� RenderTransformOrigin$ 0.504,0.158&�6�   ��6@   �� *AddHijsmiddel+6�   �� 5   
   -   5        $ image1��5      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��36��6]   $��
10,344,0,0q�6i   $	��Top=�6}   $��73��6�   �� 5   
   -   5        $ label7��5      $��Ligt het bij Stevens?��6    $
��Left=�6@   $��
21,271,0,0q�6[   $	��Top=�6o   �� 5   
   $��Stevens Lasconstructie��6   $
��Left=�64   $��154,277,0,0q�6O   $	��Top=�6d   $	��147��6|    d� 	IsChecked 6�   �� *	Stevens+�� 5   
   $
��Left=�6T   $��154,319,0,0q�6o   $	��Top=�6�   $	��128��6�   ��6   �� *
fileText+��6.   �� *ChooseCertificate+6�   �� 5    
   $��Kies certificaat��6   $
��Left=�6+   $��
24,308,0,0q�6F   $	��Top=�6Z   5"      5#      