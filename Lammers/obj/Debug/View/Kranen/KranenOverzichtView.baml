   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:Lammers.View.KranenLammers.View.Kranen  5   	   -    'Lammers.View.Kranen.KranenOverzichtView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:Lammers.View.Kranen     5   	   $��1079.522��5   I     � DataContext  6	   �� *Kranen+   Locator �� Source# [  .��5	      � .+�5
   
   �� $��Verwijder Kraan��6   $��24(�5      $
��Left=�6#   $��
446,10,0,0q�6>   $	��Top=�6R   $	��191��6j   $��37��5      ��5      �� * DataContext.DeleteKraanCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ Grid1��5         AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,28,32q�5   ]   ���	#FF979494	   GridLinesVisibility$	 
Horizontal=�5   /   
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=�5       �� SelectedItem 5      �� *SelectedKraan+ �� Mode$ TwoWay=���5      �� *Kranen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Benaming��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T    67   �� *
benaming+6T     5      $ Hijsvermogen��6%   $ * 6\    6;   �� *hijsvermogen+6\     5      $ 
Codenummer��6%   $ * 6V    69   �� *	code_nr+6V     5      $ Datum gekeurd��6%   $ * 6_    6<   �� *datum_gekeurd+6_     5      $ Datum herkeuring��6%   $	 350 6d    6?   �� *datum_herkeuring+6d      ColumnHeaderStyle 5!      �� 5"       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5#      ��  �� Property � �� �� Value$ 16(�61   5$       J� InputBindings 5'      �� 5(      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteKraanCommand+5+      �� 5,   
   -   5         ��Name$ textBox��5,      $
��Left=�6#   $��29��6>   $��	10,60,0,0q�6J    �� TextWrapping$
 Wrap=�6]   $��20(�5-   Y   $	��Top=�5.      $	��490��6.   ��5-      �� *SearchString+$ PropertyChanged=�5.   .   �� 5/   
   -   5         ��Name$ button��5/      $��Nieuwe Kraan��6E   $��24(�6\   $
��Left=�50      $��
260,10,0,0q�60   $	��Top=�6D   $	��165��6\   $��39��6h   ��5/   !   �� *AddKraanCommand+50   h   �� 51   
   -   5        $ button1��51      $��Bewerk Kraan��6G   $��24(�6^   $
��Left=�52      $��
653,10,0,0q�60   $	��Top=�6D   $	��170��6\   $��37��6h   ��51   "   �� *EditKraanCommand+52   h   �� 53   
   -   5        $ button2��53      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��54      �� -   5         ��Name$ image��54      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S    J� RenderTransformOrigin$ -0.18,0.568&�6^   55      �� 56   
   $��Open Certificaat��6   $
��Left=�6W   $��
844,10,0,0q�6r   $	��Top=�6�   $	��187��6�   $��24(�6�   $��37��6�   ��6,   �� *OpenCertificateCommand+6�   �� 57   
   -   5        $ image1��57      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��54��6]   $	��Top=�6i   $	��134��6�   �� 58   
   $��Stevens��6   $��25(�6k   $
��Left=�6y   $��
530,57,0,0q�6�   $	��Top=�6�   $��34��6�   $	��107��6�   ��6%   �� *FilterCommand+  d� 	IsChecked  6G   �� *StevensFilter+6�   �� 59   
   $��Lammers��6   $��25(�6k   $
��Left=�6y   $��
653,58,0,0q�6�   $	��Top=�6�   ��6%   �� *FilterCommand+  6G   �� *LammersFilter+6�   5:      5;      