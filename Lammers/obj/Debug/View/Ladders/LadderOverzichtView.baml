   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Lammers.View.LaddersLammers.View.Ladders  5   	   .    (Lammers.View.Ladders.LadderOverzichtView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Lammers.View.Ladders     5   	   $��1412.61��5   J     � DataContext  6	   �� *	Ladders+   Locator �� Source# [  .��5
      � $
��1240��6   .+�5   
   �� $��Verwijder Ladder��6   $��20(�5      $
��Left=�6#   $��
388,10,0,0q�6>   $	��Top=�6R   $	��182��6j   $��37��5      ��5      �� *!DataContext.DeleteLadderCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$
 Grid��5         AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,0,32q�5   ^   ���	#FF979494	   GridLinesVisibility$	 
Horizontal=�5   /   
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=�5       �� SelectedItem 5      �� *SelectedLadder+ �� Mode$ TwoWay=���5      �� *	Ladders+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Benaming��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T    67   �� *
benaming+6T     5      $
 Merk��6%   $ * 6L    63   �� *merk+6L     5      $ 
LAM nummer��6%   $ * 6U    69   �� *LAM_nr+6U     5      $ Code nummer��6%   $ * 6W    6:   �� *	code_nr+6W     5      $ datum gekeurd��6%   $ * 6^    6<   �� *datum_gekeurd+6^     5      $ datum herkeuring��6%   $ * 6d    6?   �� *datum_herkeuring+6d     5      $ Bouwjaar��6%   $ * 6T    67   �� *
bouwjaar+6T      ColumnHeaderStyle 5#      �� 5$       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5%      ��  �� Property � �� �� Value$ 16(�61   5&       J� InputBindings 5)      �� 5*      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteLadderCommand+5-      �� 5.   
   -   5         ��Name$ textBox��5.      $
��Left=�6#   $��29��6>   $��	10,60,0,0q�6J    �� TextWrapping$
 Wrap=�6]   $��20(�5/   Y   $	��Top=�50      $
��1230��6.   ��5/      �� *SearchString+$ PropertyChanged=�50   .   �� 51   
   -   5         ��Name$ button��51      $��Nieuwe ladder��6F   $��20(�6^   $
��Left=�52      $��	215,9,0,0q�60   $	��Top=�6C   $	��167��6[   $��38��6g   ��51   !   �� *AddLadderCommand+52   g   �� 53   
   -   5        $ button1��53      $��Bewerk ladder��6H   $��20(�6`   $
��Left=�54      $��
576,10,0,0q�60   $	��Top=�6D   $	��175��6\   $��37��6h   ��53   "   �� *EditLadderCommand+54   h   �� 55   
   -   5        $ button2��55      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��56      �� -   5         ��Name$ image��56      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S    J� RenderTransformOrigin$ -0.18,0.568&�6^   57      �� 58   
   -   5        $ image1��58      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��54��6]   $	��Top=�6i   $	��134��6�   �� 59   
   $��Testresultaten��6   $
��Left=�6U   $��	930,9,0,0q�6p   $	��Top=�6�   $	��176��6�   $��20(�6�   $��40��6�   ��6*   �� *OpenCertificateCommand+6�   �� 5:   
   $��Open certificaat��6   $
��Left=�6a   $��	758,9,0,0q�6|   $	��Top=�6�   $	��168��6�   $��20(�6�   $��40��6�   $ 0.621,0.622&�6�   ��6,   �� *" OpenIndividualCertificateCommand+6�   �� 5;   
   $��Bewerk testresultaten��6   $
��Left=�6^   $��1111,10,0,0q�6y   $	��Top=�6�   $	��119��6�   $��11(�6�   $��40��6�   $ 0.621,0.622&�6�   ��61   �� *ChangeCertificateCommand+6�   5<      5=      