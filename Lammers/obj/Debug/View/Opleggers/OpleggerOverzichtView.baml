   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:Lammers.View.OpleggersLammers.View.Opleggers  5   	   2    ,Lammers.View.Opleggers.OpleggerOverzichtView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   6local$clr-namespace:Lammers.View.Opleggers     5   	   $��1158.38��5   L     � DataContext  6	   �� *	Opleggers+   Locator �� Source# [  .��5	      � .+�5
   
   �� $��Verwijder Oplegger��6   $��20(�5      $
��Left=�6#   $��	448,3,0,0q�6>   $	��Top=�6Q   $	��190��6i   $��46��5      ��5      �� *#!DataContext.DeleteOpleggerCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$
 Grid��5         AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q�5   `   ���	#FF979494	   GridLinesVisibility$	 
Horizontal=�5   /   
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=�5       �� SelectedItem 5      �� *SelectedOplegger+ �� Mode$ TwoWay=���5      �� *	Opleggers+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Benaming��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T    67   �� *
benaming+6T     5      $ Kenteken��6%   $ * 6T    67   �� *
kenteken+6T     5      $ Bouwjaar��6%   $ * 6T    67   �� *
bouwjaar+6T     5      $ Status��6%   $ * 6P    65   �� *status+6P     5      $ Datum gekeurd��6%   $ * 6_    6<   �� *datum_gekeurd+6_     5      $ Datum herkeuring��6%   $ * 6d    6?   �� *datum_herkeuring+6d     5      $ 	Stamkaart��6%   $ * 6V    68   �� *	stamkaart+6V      ColumnHeaderStyle 5#      �� 5$       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5%      ��  �� Property � �� �� Value$ 16(�61   5&       J� InputBindings 5)      �� 5*      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteOpleggerCommand+5-      �� 5.   
   -   5         ��Name$ textBox��5.      $
��Left=�6#   $��29��6>   $��	10,60,0,0q�6J    �� TextWrapping$
 Wrap=�6]   $��20(�5/   Y   $	��Top=�50      $
��1155��6.   ��5/      �� *SearchString+$ PropertyChanged=�50   .   �� 51   
   -   5         ��Name$ button��51      $��Nieuwe Oplegger��6H   $��20(�6b   $
��Left=�52      $��	238,8,0,0q�60   $	��Top=�6C   $	��180��6[   $��39��6g    J� RenderTransformOrigin$ 0.5,0.5&�6s   ��51   !   �� *AddOpleggerCommand+z�53      V� 54      .~�55      �� �� 56      �� 57       �� Angle$ -0.054Q�6&   T� 58      59      5;      �� 5<   
   -   5        $ button1��5<      $��Bewerk Oplegger��6J   $��20(�6d   $
��Left=�5=      $��	690,3,0,0q�60   $	��Top=�6C   $	��187��6[   $��46��6g   ��5<   "   �� *EditOpleggerCommand+5=   g   �� 5>   
   -   5        $ button2��5>      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��5?      �� -   5          ��Name$  image��5?      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S   $ -0.18,0.568&�6^   5@      �� 5A   
   -   5        $  image1��5A      $��/Images/lammers_logo.jpg��6    $
��Left=�6B   $��54��6]   $	��Top=�6i   $	��134��6�   �� 5B   
   $��Open Certificaat��6   $
��Left=�6W   $��	930,3,0,0q�6r   $	��Top=�6�   $	��188��6�   $��20(�6�   $��46��6�   ��6,   �� *OpenCertificateCommand+6�   5C      5D      