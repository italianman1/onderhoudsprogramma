   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  5   	   2    ,Lammers.View.Hijsmiddelen.EditHijsmiddelView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:Lammers.View.Hijsmiddelen     5   	   $	��390��5   Q   $��336.647��6^     � DataContext  6	   �� *EditHijsmiddel+   Locator �� Source# [  .��5      � .+�5	   
   �� -   5         ��Name$ label��5	      $��Wijzig hijsmiddel ��6   $��Arial)�6<   $��20(�6O   $
��Left=�6]   $��	81,-2,0,0q�6x   $	��Top=�6�   �� 5
   
   -   5        $ label1��5
      $��Soort hijsmiddel:��6    $
��Left=�6<   $��
24,136,0,0q�6W   $	��Top=�6k   �� 5   
   -   5         ��Name$ comboBox��5      $
��Left=�5   U   $��154,136,0,0q�6p   $	��Top=�6�   $	��128��6�    �� SelectedItem 6	   ��  �� Path$ SelectedSoort���65   �� *	Soorten+6�   �� 5   
   -   5        $ label2��5      $��Datum gekeurd��6    $
��Left=�68   $��	24,52,0,0q�6S   $	��Top=�6f   �� 5   
   -   5        $ label3��5      $��Datum herkeuring��6    $
��Left=�6;   $��	26,95,0,0q�6V   $	��Top=�6i   �� 5   
   -   5         ��Name$ textBox��5      $
��Left=�6#   $��23��6>   $��154,173,0,0q�6J    �� TextWrapping$
 Wrap=�6_   $	��Top=�6�   $	��128��6�   ��6s   �� *Registratienummer+6�   �� 5   
   -   5        $ label4��5      $��Registratienummer��6    $
��Left=�6<   $��
21,170,0,0q�6W   $	��Top=�6k   �� 5   
   -   5        $ label5��5      $��Certificaatnummer��6    $
��Left=�6<   $��
21,206,0,0q�6W   $	��Top=�6k   �� 5   
   -	   5        $ textBox1��5      $
��Left=�6$   $��23��6?   $��154,207,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *Certificaatnummer+6�   �� 5   
   -
   5        $ label6��5      $��Status��6    $
��Left=�61   $��
21,245,0,0q�6L   $	��Top=�6`   �� 5   
   -   5        $ 	comboBox1��5      $
��Left=�6j   $��154,248,0,0q�6�   $	��Top=�6�   $	��128��6�   ��6&   �� *Stats+ 6D   �� *SelectedStat+6�   (  "System.Windows.Controls.DatePicker  5   
   $
��Left=�6   $��
154,54,0,0q�6V   $	��Top=�6j   $	��128��6�      SelectedDate 60   �� *Keuringdatum+6�     5   
   $
��Left=�6   $��
154,97,0,0q�6Z   $	��Top=�6n   $	��128��6�    60   �� *Herkeuringsdatum+6�   �� 5   
   -   5        	 ��Name$	 button2��5      $
��Left=�6B   $��10,2,0,0q�6]   $	��Top=�6o   $��45��6�   $��24��6�   ��6"   �� *BackCommand+.��5      �� -   5        
 ��Name$
 image��5      $ ��/Images/arrow-back-128.png��6#   $��24��6G   $��35��6S   5      �� 5   
   -   5        $	 button1��5      $��Wijzig hijsmiddel��6"   $
��Left=�6a   $��154,349,0,0q�6|   $	��Top=�6�   $	��128��6�   ��6>   �� *EditHijsmiddel+6�   �� 5   
   -   5        $
 image1��5      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��40��6]   $��
21,340,0,0q�6i   $	��Top=�6}   $��70��6�   �� 5   
   -   5        $ label7��5      $��Ligt het bij Stevens?��6    $
��Left=�6@   $��
21,278,0,0q�6[   $	��Top=�6o   �� 5   
   $��Stevens Lasconstructie��6   $
��Left=�64   $��154,283,0,0q�6O   $	��Top=�6d   $	��147��6|    d� 	IsChecked 6�   �� *	Stevens+�� 5   
   $
��Left=�6T   $��154,319,0,0q�6o   $	��Top=�6�   $	��128��6�   ��6   �� *
fileText+��6.   �� *ChooseCertificate+6�   �� 5   
   $��Kies certificaat��6   $
��Left=�6+   $��
21,309,0,0q�6F   $	��Top=�6Z   5       5!      