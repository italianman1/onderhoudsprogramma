   M S B A M L   `   `   `  ����B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:Lammers.View.ValbeveiligingLammers.View.Valbeveiliging  5   	   >    8Lammers.View.Valbeveiliging.ValbeveiligingsOverzichtView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ;local)clr-namespace:Lammers.View.Valbeveiliging     5   	   $��1267.816��5   [     � DataContext  6	   �� *ValbeveiligingsOverzicht+   Locator �� Source# [  .��5	      � .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$
 Grid��5         AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q�5   e   ���	#FF979494   GridLinesVisibility$ 
Horizontal=�5   /      HorizontalGridLinesBrush �	#FFF0E0E0   HeadersVisibility$ Column=�5      	 �� SelectedItem	 5      �� *SelectedValbeveiliging+
 �� Mode$
 TwoWay=���5      �� *Valbeveiliging+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ #��6%      
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding 60   �� *Id+6G     5      $ Omschrijving��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6\    6;   �� *omschrijving+6\     5      $ Opdracht nummer��6%   $ * 6[    6>   �� *	opdr_nr+6[     5      $ Persoon��6%   $ * 6R    66   �� *	persoon+6R     5      $ Serie nr��6%   $ * 6U    67   �� *
serie_nr+6U     5      $ Datum gekeurd��6%   $ * 6^    6<   �� *datum_gekeurd+6^     5      $ Datum herkeuring��6%   $ * 6d    6?   �� *datum_herkeuring+6d      ColumnHeaderStyle 5      �� 5       �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6   .�5      ��  �� Property � �� �� Value$ 16(�61   5       J� InputBindings 5!      �� 5"      
 �� Key$ Delete��6    �� Command 6*   �� *DeleteValbeveiligingCommand+5%      �� 5&   
   -   5         ��Name$ textBox��5&      $
��Left=�6#   $��29��6>   $��	10,60,0,0q�6J    �� TextWrapping$
 Wrap=�6]   $��20(�5'   Y   $	��Top=�5(      $
��1248��6.   ��5'      �� *SearchString+$ PropertyChanged=�5(   .   �� 5)   
   -   5         ��Name$ button2��5)      $
��Left=�6B   $��	129,3,0,0q�6]   $	��Top=�6p   $��75��6�   $��44��6�   ��6"   �� *BackCommand+.��5*      �� -   5         ��Name$ image��5*      $ ��/Images/arrow-back-128.png��6#   $��44��6G   $��75��6S    J� RenderTransformOrigin$ -0.18,0.568&�6^   5+      �� 5,   
   -   5        $ button3��5,      $
��Left=�6B   $��47��6]   $	��Top=�6i   $��91��6�   ��6"   �� *HomeCommand+.��5-      �� -   5        $ image1��5-      $��/Images/lammers_logo.jpg��6$   $
��Left=�6F   $��44��6a   $	��Top=�6m   $��88��6�   5.      �� 5/   
   -   5        $ button��5/      $��Maak valbeveiliging��6!   $��20(�6l   $
��Left=�6z   $��	254,9,0,0q�6�   $	��Top=�6�   $	��195��6�   $��38��6�   ��6?   �� *AddValbeveiligingCommand+6�   �� 50   
   -   5        $ button_Copy��50      $��Wijzig valbeveiliging��6&   $��20(�6t   $
��Left=�6�   $��
478,10,0,0q�6�   $	��Top=�6�   $	��203��6�   $��37��6�   ��6F   �� *EditValbeveiligingCommand+6�   �� 51   
   -	   5        $ button_Copy1��51      $��Verwijder valbeveiliging��6'   $��20(�6z   $
��Left=�6�   $��
701,10,0,0q�6�   $	��Top=�6�   $	��227��6�   $��37��6�   ��6J   �� *DeleteValbeveiligingCommand+6�   �� 52   
   $��Open certificaat��6   $
��Left=�6W   $��
961,10,0,0q�6r   $	��Top=�6�   $��20(�6�   $	��161��6�   $��37��6�   ��6,   �� *OpenCertificateCommand+6�   53      54      