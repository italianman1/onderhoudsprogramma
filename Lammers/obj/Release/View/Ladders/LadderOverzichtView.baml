   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Lammers.View.LaddersLammers.View.Ladders  .    (Lammers.View.Ladders.LadderOverzichtView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:Lammers.View.Ladders       � DataContext  �� *	Ladders+   Locator �� Source# [  .��� $
��1240��.+��� $��Verwijder Ladder��$��20(�$
��Left=�$��
438,10,0,0q�$	��Top=�$	��182��$��37������ *!DataContext.DeleteLadderCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q����	#FF979494	   GridLinesVisibility$	 
Horizontal=�
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedLadder+ �� Mode$ TwoWay=����� *	Ladders+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Benaming��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *
benaming+  $
 Merk��$ *  �� *merk+  $ 
LAM nummer��$ *  �� *LAM_nr+  $ Code nummer��$ *  �� *	code_nr+  $ datum gekeurd��$ *  �� *datum_gekeurd+  $ datum herkeuring��$ *  �� *datum_herkeuring+  $ Bouwjaar��$ *  �� *
bouwjaar+  $ 	Stamkaart��$ *  �� *	stamkaart+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteLadderCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$
��1900������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuwe ladder��$��20(�$
��Left=�$��	241,9,0,0q�$	��Top=�$	��167��$��38������ *AddLadderCommand+�� -   $ button1��$��Bewerk ladder��$��20(�$
��Left=�$��
653,10,0,0q�$	��Top=�$	��175��$��37������ *EditLadderCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75�� J� RenderTransformOrigin$ -0.18,0.568&��� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134���� $��Open Certificaat��$
��Left=�$��	890,7,0,0q�$	��Top=�$	��177��$��20(�$��40������ *OpenCertificateCommand+