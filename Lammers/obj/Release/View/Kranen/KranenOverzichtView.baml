   M S B A M L   `   `   `  ���� B  >Lammers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:Lammers.View.KranenLammers.View.Kranen  -    'Lammers.View.Kranen.KranenOverzichtView   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     3local!clr-namespace:Lammers.View.Kranen     $��1079.522��  � DataContext  �� *Kranen+   Locator �� Source# [  .��� .+��� $��Verwijder Kraan��$��24(�$
��Left=�$��
446,10,0,0q�$	��Top=�$	��191��$��37������ * DataContext.DeleteKraanCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType" >�&   System.Windows.Controls.DataGrid  -     Name$ Grid1��   AutoGenerateColumns .     CanUserDeleteRows .     
IsReadOnly . $��11,102,28,32q����	#FF979494	   GridLinesVisibility$	 
Horizontal=�
   HorizontalGridLinesBrush
 �	#FFF0E0E0   HeadersVisibility$ Column=� �� SelectedItem �� *SelectedKraan+ �� Mode$ TwoWay=����� *Kranen+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ #��   
Foreground �	#FF1D16161  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Id+  $ Benaming��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *  �� *
benaming+  $ Hijsvermogen��$ *  �� *hijsvermogen+  $ 
Codenummer��$ *  �� *	code_nr+  $ Datum gekeurd��$ *  �� *datum_gekeurd+  $ Datum herkeuring��$	 350  �� *datum_herkeuring+   ColumnHeaderStyle ��  �� 
TargetType=  7System.Windows.Controls.Primitives.DataGridColumnHeader"  .���  �� Property � �� �� Value$ 16(� J� InputBindings �� 
 �� Key$ Delete�� �� Command �� *DeleteKraanCommand+�� -    ��Name$ textBox��$
��Left=�$��29��$��	10,60,0,0q� �� TextWrapping$
 Wrap=�$��20(�$	��Top=�$	��490������ *SearchString+$ PropertyChanged=��� -    ��Name$ button��$��Nieuwe Kraan��$��24(�$
��Left=�$��
260,10,0,0q�$	��Top=�$	��165��$��39������ *AddKraanCommand+�� -   $ button1��$��Bewerk Kraan��$��24(�$
��Left=�$��
653,10,0,0q�$	��Top=�$	��170��$��37������ *EditKraanCommand+�� -   $ button2��$
��Left=�$��	129,3,0,0q�$	��Top=�$��75��$��44������ *BackCommand+.���� -    ��Name$ image��$ ��/Images/arrow-back-128.png��$��44��$��75�� J� RenderTransformOrigin$ -0.18,0.568&��� $��Open Certificaat��$
��Left=�$��
844,10,0,0q�$	��Top=�$	��187��$��24(�$��37������ *OpenCertificateCommand+�� -   $ image1��$��/Images/lammers_logo.jpg��$
��Left=�$��54��$	��Top=�$	��134���� $��Stevens��$��25(�$
��Left=�$��
530,57,0,0q�$	��Top=�$��34��$	��107������ *FilterCommand+  d� 	IsChecked  �� *StevensFilter+�� $��Lammers��$��25(�$
��Left=�$��
653,58,0,0q�$	��Top=����� *FilterCommand+  �� *LammersFilter+