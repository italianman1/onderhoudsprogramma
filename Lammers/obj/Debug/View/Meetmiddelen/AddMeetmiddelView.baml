   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.MeetmiddelenLammers.View.Meetmiddelen  5   	   1    +Lammers.View.Meetmiddelen.AddMeetmiddelView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:Lammers.View.Meetmiddelen     5   	   $��464.976��5   P     � DataContext  6	   �� *AddMeetmiddel+   Locator �� Source# [  .��5	      �  � ColumnDefinitions 5
   
   �� 5      �� 5      $��0* �6   .+�5   
   �� -   5         ��Name$ label��5      $��Voeg een Meetmiddel toe��6   $��Arial)�6A   $��20(�6T   $
��Left=�6b   $��60,1,0,0q�6}   $	��Top=�6�   �� 5   
   -   5        $ label2��5      $��Datum gekeurd��6    $
��Left=�68   $��	27,50,0,0q�6S   $	��Top=�6f   $��31��6~   $��95��6�   �� 5   
   -   5        $ label3��5      $��Datum herkeuring��6    $
��Left=�6;   $��	27,94,0,0q�6V   $	��Top=�6i   $��33��6�   $	��108��6�   �� 5   
   -   5        $ label5��5      $��Code nummer��6    $
��Left=�66   $��
24,139,0,0q�6Q   $	��Top=�6e   $��33��6}   $	��111��6�   �� 5   
   -   5         ��Name$ textBox1��5      $
��Left=�6$   $��29��6?   $��161,143,0,0q�6K    �� TextWrapping$
 Wrap=�6`   $	��Top=�6�   $	��131��6�   ��6t   �� *
Codenummer+6�   �� 5   
   -   5        $ label6��5      $��Bouwjaar��6    $
��Left=�63   $��
24,198,0,0q�6N   $	��Top=�6b   $��33��6z   $��76��6�   (  "System.Windows.Controls.DatePicker  5   
   $
��Left=�6   $��
161,50,0,0q�6V   $	��Top=�6j   $	��131��6�   $��28��6�      SelectedDate 60   �� *Keuringdatum+6�     5   
   $
��Left=�6   $��
161,97,0,0q�6Z   $	��Top=�6n   $	��131��6�   $��30��6�    60   �� *Herkeuringsdatum+6�   �� 5   
   -   5         ��Name$ button2��5      $
��Left=�6B   $��10,2,0,0q�6]   $	��Top=�6o   $��45��6�   $��24��6�   ��6"   �� *BackCommand+.��5      �� -   5         ��Name$ image��5      $ ��/Images/arrow-back-128.png��6#   $��24��6G   $��35��6S   5      �� 5   
   -	   5        $ button1��5      $��Maak Meetmiddel aan��6"   $
��Left=�6b   $��162,420,0,0q�6}   $	��Top=�6�   $	��128��6�   ��6@   �� *AddMeetmiddel+6�   �� 5   
   -
   5        $ image1��5      $��/Images/lammers_logo.jpg��6    $��36��6B   $��24,412,195,0q�6N   $	��Top=�6d   �� 5   
   -   5        $ label6_Copy��5      $��Leverancier��6%   $
��Left=�6;   $��
24,245,0,0q�6V   $	��Top=�6j   $��33��6�   $��76��6�   �� 5   
   -   5        $ label6_Copy1��5      $
��Merk��6&   $
��Left=�65   $��
24,283,0,0q�6P   $	��Top=�6d   $��33��6|   $��76��6�   �� 5   
   -   5        $ label6_Copy2��5      $��Benaming��6&   $
��Left=�69   $��
24,328,0,0q�6T   $	��Top=�6h   $��33��6�   $��76��6�   �� 5   
   -   5        $ textBox_Copy��5      $
��Left=�6(   $��27��6C   $��161,245,0,0q�6O   $
 Wrap=�6d   $	��Top=�6�   $	��131��6�   ��6x   �� *Leverancier+6�   �� 5   
   -   5        $ textBox_Copy1��5      $
��Left=�6)   $��27��6D   $��161,283,0,0q�6P   $
 Wrap=�6e   $	��Top=�6�   $	��131��6�   ��6y   �� *Merk+6�   �� 5    
   -   5        $ textBox_Copy2��5       $
��Left=�6)   $��27��6D   $��161,328,0,0q�6P   $
 Wrap=�6e   $	��Top=�6�   $	��131��6�   ��6y   �� *
Benaming+6�   �� 5!   
   -   5        $ textBox2��5!      $
��Left=�6$   $��23��6?   $��161,200,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��129��6�   ��6t   �� *
Bouwjaar+6�   �� 5"   
   $
��Left=�6T   $��161,368,0,0q�6o   $	��Top=�6�   $	��128��6�   ��6   �� *
fileText+��6.   �� *ChooseCertificate+6�   �� 5#   
   $��Kies certificaat��6   $
��Left=�6+   $��
24,366,0,0q�6F   $	��Top=�6Z   5$      5%      