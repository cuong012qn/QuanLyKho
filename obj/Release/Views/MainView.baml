   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  #    QuanLyKho_MVVM.Views.MainView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:QuanLyKho_MVVM.Views     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  (ucclr-namespace:QuanLyKho_MVVM.UC  -   $��mainView��$��20(�  � Title$  Màn hình chính��$	��700��$
��1100�� � WindowStartupLocation$ CenterScreen=� 
  MainVM � DataContext# [   � AllowsTransparency .  � WindowStyle$
 None=� � 
ResizeMode$ NoResize=�.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction  	   Command	 �� *LoadedWindowCommand+
   CommandParameter
 ��  �� ElementName$ mainView��.��)  #MaterialDesignThemes.Wpf.DialogHost     
Identifier$
 Root��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�
 � Tag �� *Title+$ mainView����  �� Orientation$ 
Horizontal=�$��Right=�$	��Top=�.+��� $��5q�$��20(�$��Center=�$��Center=����� *DisplayName+�� $��
Thông tin��$��20(����	#FF81CAF3
�������$��5q�$��50������ *CommandChangeInfoUser+#  MaterialDesignThemes.Wpf.Card  $��Stretch=�$��Stretch=�$��5q�$	��Top=�.���� $��Chức năng��$��5q�$��20(�$	��150��$	��Top=�.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�.���  � ColumnDefinitions �� $	��150 ��� $	��150 ��� $	��150 ��� $	��150 ��� $	��150 ��� $	��150 �.+��� $��75��$��2q� # MaterialDesignRaisedLightButton#��[ ���	#FF81CAF3
�������+	  %MaterialDesignThemes.Wpf.ButtonAssist 	  CornerRadius$ 5�� � ToolTip$ 
Nhập kho������ *InputCommand+.���� $ 
Horizontal=�.+�'
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$ Import=�$��Stretch=��� $��
Nhập kho��$��20(��� #��[ ���	#FF81CAF3
�������$��75��$ 5��$ 
Xuất kho��$��2q�$��1������ *OutputCommand+.���� $ 
Horizontal=�.+�
  $ Export=�$��Stretch=��� $��
Xuất kho��$��20(��� $��3��$��75��#��[ ���	#FF81CAF3
�������$ 5��$ Thông tin khách hàng��$��2q����� *CustomerCommand+.���� $ 
Horizontal=�.+�
  $ UserBox=�$��	-10 0 0 0q�$��Stretch=��� $��Khách hàng��$
��Wrap=�$��20(��� $��2��$��75��#��[ ���	#FF81CAF3
�������$ 5��$ 
Đơn vị��$��2q����� *UnitCommand+.���� $ 
Horizontal=�.+�
  $ 
AngleAcute=�$��Stretch=��� $��
Đơn vị��$
��Wrap=�$��20(��� $��4��$��75��#��[ ���	#FF81CAF3
�������$ 5��$ Nhà cung cấp��$��2q����� *SuplierCommand+.���� $ 
Horizontal=�.+�
  $ ImportExport=�$��Stretch=��� .+��� $��
Nhà cung ��$
��Wrap=�$��20(��� $��cấp��$
��Wrap=�$��20(��� $��5��$��75��#��[ ���	#FF81CAF3
�������$ 5��$ Khách hàng��$��2q����� *ObjectCommand+.���� $ 
Horizontal=�.+�
  $ BoxVariantClosed=�$��Stretch=��� $��Mặt hàng��$
��Wrap=�$��20(�  $��Stretch=�$��Stretch=�$��5q�$	��Top=�.���� $��Thống kê��$��5q�$ PrimaryLight=�.��]� .+��� $ 
Horizontal=�$	��Top=�$��5q�.+��� $��5q�$��
Từ ngày��$��Stretch=�(  "System.Windows.Controls.DatePicker  $	��150���� $��5q�$��Đến ngày��$��Stretch=�  $	��150���� $
��Auto=�$
��Auto=�$	��Top=�.���� $��5q����� *ListInputInfos+ �� Mode$ TwoWay=� �� View �� .P��� $��Tên hàng hóa�� �� DisplayMemberBinding �� *Object.DisplayName+�� $��Số lượng�� �� *Count+�� $��Giá nhập�� �� *
InputPrice+�� $��	Giá bán�� �� *OutputPrice+�� $��Tình trạng�� �� *Status+�� $��
Ngày bán�� �� *Input.DateInput+