   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Lammers.View.HijsmiddelenLammers.View.Hijsmiddelen  5   	   6    0Lammers.View.Hijsmiddelen.HijsgereedschappenView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   9local'clr-namespace:Lammers.View.Hijsmiddelen     5   	   $��1407.794��5   O     � DataContext  6	   �� *Hijsmiddelen+   Locator �� Source# [  .��5
      � $	��337��6   .+�5   
   �� $��Verwijder Hijsmiddel��6   $��24(�5      $
��Left=�6#   $��
490,10,0,0q�6>   $	��Top=�6R   $	��259��6j   $��45��5       J� RenderTransformOrigin$ 	0.2,0.518&�6!   ��5      �� *%#DataContext.DeleteHijsmiddelCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$
 Grid��5         AutoGenerateColumns .     CanUserDeleteRows .  	   
IsReadOnly	 . $��11,124,28,0q�5   c   ���	#FF979494
   GridLinesVisibility$
 
Horizontal=�5   /      HorizontalGridLinesBrush �	#FFF0E0E0   HeadersVisibility$ Column=�5       �� SelectedItem 5      �� *SelectedHijsmiddel+ �� Mode$ TwoWay=���5      �� *Hijsmiddelen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Soort hijsmiddel��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6Y    6?   �� *soort+6Y     5      $ Datum gekeurd��6%   $ * 6_    6<   �� *datum_gekeurd+6_     5      $ Datum herkeuring��6%   $ * 6d    6?   �� *datum_herkeuring+6d     5      $ Certificaat nr��6%   $ * 6Z    6=   �� *
certi_nr+6Z     5      $ Registratie nr��6%   $ * 6X    6=   �� *reg_nr+6X     5      $ Certificaat link��6%   $ * 6_    6?   �� *certificaat+6_     5      $ Status��6%   $	 350 6P    65   �� *status+6P      ColumnHeaderStyle 5#      �� 5$       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5%      ��  �� Property � �� �� Value$ 16(�61   5&       J� InputBindings 5)      �� 5*      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteHijsmiddelCommand+5-      �� 5.   
   -   5         ��Name$ textBox��5.      $
��Left=�6$   $��29��6?   $��	10,77,0,0q�6K    �� TextWrapping$
 Wrap=�6^   $��20(�5/   Y   $	��Top=�50      $	��794��6.   ��5/      �� *SearchString+$ PropertyChanged=�50   .   �� 51   
   -   5         ��Name$ button��51      $��Nieuw Hijsmiddel��6J   $��24(�6e   $
��Left=�52      $��	238,9,0,0q�60   $	��Top=�6C   $	��212��6[   $��45��6g   ��51   !   �� *AddHijsmiddelCommand+52   g   �� 53   
   -   5        $ button1��53      $��Bewerk Hijsmiddel��6L   $��24(�6h   $
��Left=�54      $��	793,9,0,0q�60   $	��Top=�6C   $	��234��6[   $��45��6g   ��53   "   �� *EditHijsmiddelCommand+54   g   �� 55   
   -   5        $ button2��55      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��56      �� -   5         ��Name$ image��56      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S   $ -0.18,0.568&�6^   57      �� 58   
   -   5        $ image1��58      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��54��6]   $	��Top=�6i   $	��134��6�   �� 59   
   $��Open Certificaat��6   $
��Left=�6W   $��
1054,9,0,0q�6r   $	��Top=�6�   $	��205��6�   $��24(�6�   $��45��6�   ��6,   �� *OpenCertificateCommand+6�   �� 5:   
   $��Stevens��6   $��25(�6k   $
��Left=�6y   $��
860,77,0,0q�6�   $	��Top=�6�   $��38��6�   $	��184��6�   ��6%   �� *FilterCommand+  d� 	IsChecked  6G   �� *StevensFilter+6�   �� 5;   
   $��Lammers��6   $��25(�6k   $
��Left=�6y   $��1044,77,0,0q�6�   $	��Top=�6�   ��6%   �� *FilterCommand+  6G   �� *LammersFilter+6�   5<      5=      