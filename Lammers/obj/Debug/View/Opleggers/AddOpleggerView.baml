   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:Lammers.View.OpleggersLammers.View.Opleggers  5   	   ,    &Lammers.View.Opleggers.AddOpleggerView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   6local$clr-namespace:Lammers.View.Opleggers     5   	   $��295.73��5   N     � DataContext  6	   �� *AddOplegger+   Locator �� Source# [  .��5	      � $	��480��6   .+�5
   
   �� -   5         ��Name$ label��5
      $��Voeg een oplegger toe��6   $��Arial)�6?   $��20(�6R   $
��Left=�6`   $��60,0,0,0q�6{   $	��Top=�6�   �� 5   
   -   5        $ label2��5      $��Datum gekeurd��6    $
��Left=�68   $��	25,94,0,0q�6S   $	��Top=�6f   �� 5   
   -   5        $ label3��5      $��Datum herkeuring��6    $
��Left=�6;   $��
25,131,0,0q�6V   $	��Top=�6j   �� 5   
   -   5         ��Name$ textBox��5      $
��Left=�6#   $��23��6>   $��154,170,0,0q�6J    �� TextWrapping$
 Wrap=�6_   $	��Top=�6�   $	��128��6�   ��6s   �� *
Codenummer+6�   �� 5   
   -   5        $ label4��5      $��Code nummer��6    $
��Left=�66   $��
26,167,0,0q�6Q   $	��Top=�6e   �� 5   
   -   5        $ label5��5      $��Kenteken��6    $
��Left=�63   $��
27,210,0,0q�6N   $	��Top=�6b   �� 5   
   -   5        $ textBox1��5      $
��Left=�6$   $��23��6?   $��154,213,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *
Kenteken+6�   (  "System.Windows.Controls.DatePicker  5   
   $
��Left=�6   $��
154,94,0,0q�6V   $	��Top=�6j   $	��128��6�      SelectedDate 60   �� *Keuringdatum+6�     5   
   $
��Left=�6   $��154,133,0,0q�6Z   $	��Top=�6o   $	��128��6�    60   �� *Herkeuringsdatum+6�   �� 5   
   -   5         ��Name$ button2��5      $
��Left=�6B   $��10,2,0,0q�6]   $	��Top=�6o   $��45��6�   $��24��6�   ��6"   �� *BackCommand+.��5      �� -	   5         ��Name$ image��5      $ ��/Images/arrow-back-128.png��6#   $��24��6G   $��35��6S   5      �� 5   
   -
   5        $ button1��5      $��Maak een oplegger aan��6"   $
��Left=�6b   $��154,431,0,0q�6}   $	��Top=�6�   $	��139��6�    J� RenderTransformOrigin$ 0.497,0&�6�   ��6B   �� *AddOplegger+6�   �� 5   
   -   5        $ image1��5      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��39��6]   $��
10,431,0,0q�6i   $	��Top=�6}   $��73��6�   �� 5   
   -   5        $ label6��5      $��Leverancier��6    $
��Left=�66   $��
27,248,0,0q�6Q   $	��Top=�6e   $ -0.053,-0.508&�6}   �� 5   
   -   5        $ textBox2��5      $
��Left=�6$   $��23��6?   $��154,251,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *Leverancier+6�   �� 5   
   -   5        $ label1��5      $��Benaming��6    $
��Left=�63   $��	24,52,0,0q�6N   $	��Top=�6a   �� 5   
   -   5        $ textBox3��5      $
��Left=�6$   $��23��6?   $��
154,54,0,0q�6K   $
 Wrap=�6_   $	��Top=�6�   $	��128��6�   ��6s   �� *
Benaming+6�   �� 5   
   -   5        $ label7��5      $��Bouwjaar��6    $
��Left=�63   $��
26,289,0,0q�6N   $	��Top=�6b   �� 5   
   -   5        $ textBox4��5      $
��Left=�6$   $��23��6?   $��154,292,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *
Bouwjaar+6�   �� 5   
   -   5        $ label8��5      $��Locatie��6    $
��Left=�62   $��
27,326,0,0q�6M   $	��Top=�6a   �� 5   
   -   5        $ textBox5��5      $
��Left=�6$   $��23��6?   $��154,328,0,0q�6K   $
 Wrap=�6`   $	��Top=�6�   $	��128��6�   ��6t   �� *	Locatie+6�   �� 5    
   $
��Left=�6T   $��154,400,0,0q�6o   $	��Top=�6�   $	��128��6�   ��6   �� *
fileText+��6.   �� *ChooseCertificate+6�   �� 5!   
   $��Kies certificaat��6   $
��Left=�6+   $��
26,400,0,0q�6F   $	��Top=�6Z   $ 
0.545,0.01&�6r   �� 5"   
   -   5        $ label9��5"      $��Status��6    $
��Left=�61   $��
26,363,0,0q�6L   $	��Top=�6`   $ 0.771,6.259&�6x   �� 5#   
   -   5        	 ��Name$	 	comboBox1��5#      $
��Left=�6j   $��154,367,0,0q�6�   $	��Top=�6�   $	��128��6�   ��6&   �� *Stats+
 �� SelectedItem
 6D   �� *SelectedStat+6�   5$      5%      