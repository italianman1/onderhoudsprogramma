   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:Lammers.View.OpleggersLammers.View.Opleggers  2    ,Lammers.View.Opleggers.OpleggerOverzichtView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6local$clr-namespace:Lammers.View.Opleggers     $��1158.38��  � DataContext  �� *	Opleggers+   Locator �� Source# [  .��� .+��� $��Verwijder Oplegger��$��20(�$
��Left=�$��	448,3,0,0q�$	��Top=�$	��190��$��46������ *#!DataContext.DeleteOpleggerCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$
 Grid��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,9,32q����	#FF979494	   GridLinesVisibility$	 
Horizontal=�
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedOplegger+ �� Mode$ TwoWay=����� *	Opleggers+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Benaming��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *
benaming+  $ Kenteken��$ *  �� *
kenteken+  $ Bouwjaar��$ *  �� *
bouwjaar+  $ Status��$ *  �� *status+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$ *  �� *datum_herkeuring+  $ 	Stamkaart��$ *  �� *	stamkaart+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteOpleggerCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$
��1155������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuwe Oplegger��$��20(�$
��Left=�$��	238,8,0,0q�$	��Top=�$	��180��$��39�� J� RenderTransformOrigin$ 0.5,0.5&����� *AddOpleggerCommand+z�V� .~��� �� ��  �� Angle$ -0.054Q�T� �� -   $ button1��$��Bewerk Oplegger��$��20(�$
��Left=�$��	690,3,0,0q�$	��Top=�$	��187��$��46������ *EditOpleggerCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -     ��Name$  image��$ ��/Images/arrow-back-128.png��$��44��$��75��$ -0.18,0.568&��� -   $  image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134���� $��Open Certificaat��$
��Left=�$��	930,3,0,0q�$	��Top=�$	��188��$��20(�$��46������ *OpenCertificateCommand+