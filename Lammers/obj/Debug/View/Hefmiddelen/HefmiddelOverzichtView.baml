   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:Lammers.View.HefmiddelenLammers.View.Hefmiddelen  5   	   5    /Lammers.View.Hefmiddelen.HefmiddelOverzichtView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   8local&clr-namespace:Lammers.View.Hefmiddelen     5   	     � DataContext  5   	   �� *Hefmiddelen+   Locator �� Source# [  .��5
      � $
��1240��6   .+�5   
   �� $��Verwijder Hefmiddel��6   $��20(�5      $
��Left=�6#   $��	465,7,0,0q�6>   $	��Top=�6Q   $	��201��6i   $��37��5      ��5      �� *$"DataContext.DeleteHefmiddelCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$
 Grid��5         AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q�5   b   ���	#FF979494	   GridLinesVisibility$	 
Horizontal=�5   /   
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=�5       �� SelectedItem 5      �� *SelectedHefmiddel+ �� Mode$ TwoWay=���5      �� *Hefmiddelen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Benaming��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T    67   �� *
benaming+6T     5      $
 Merk��6%   $ * 6L    63   �� *merk+6L     5      $ Code nummer��6%   $ * 6W    6:   �� *	code_nr+6W     5      $ datum gekeurd��6%   $ * 6^    6<   �� *datum_gekeurd+6^     5      $ datum herkeuring��6%   $ * 6d    6?   �� *datum_herkeuring+6d     5      $ Bouwjaar��6%   $ * 6T    67   �� *
bouwjaar+6T      ColumnHeaderStyle 5"      �� 5#       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5$      ��  �� Property � �� �� Value$ 16(�61   5%       J� InputBindings 5(      �� 5)      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteHefmiddelCommand+5,      �� 5-   
   -   5         ��Name$ textBox��5-      $
��Left=�6#   $��29��6>   $��	10,60,0,0q�6J    �� TextWrapping$
 Wrap=�6]   $��20(�5.   Y   $	��Top=�5/      $
��1900��6.   ��5.      �� *SearchString+$ PropertyChanged=�5/   .   �� 50   
   -   5         ��Name$ button��50      $��Nieuwe Hefmiddel��6I   $��20(�6d   $
��Left=�51      $��	243,7,0,0q�60   $	��Top=�6C   $	��192��6[   $��38��6g   ��50   !   �� *AddHefmiddelCommand+51   g   �� 52   
   -   5        $ button1��52      $��Bewerk Hefmiddel��6K   $��20(�6f   $
��Left=�53      $��	690,8,0,0q�60   $	��Top=�6C   $	��175��6[   $��37��6g   ��52   "   �� *EditHefmiddelCommand+53   g   �� 54   
   -   5        $ button2��54      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��55      �� -   5         ��Name$ image��55      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S    J� RenderTransformOrigin$ -0.18,0.568&�6^   56      �� 57   
   -   5        $ image1��57      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��54��6]   $	��Top=�6i   $	��134��6�   �� 58   
   $��Open Certificaat��6   $
��Left=�6W   $��	890,7,0,0q�6r   $	��Top=�6�   $	��177��6�   $��20(�6�   $��40��6�   ��6,   �� *OpenCertificateCommand+6�   59      5:      