   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  $    QuanLyKho_MVVM.Views.InputView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:QuanLyKho_MVVM.Views     .ucclr-namespace:QuanLyKho_MVVM.UC     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  -   $��	inputView��$��20(�   InputVM  � DataContext#  [   � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � WindowState$ 	Maximized=� � Title$ Phiếu nhập hàng hóa��$	��850��$	��850�� J� InputBindings �� 
 �� Key$ F5�� �� Command �� *
AddCommand+�� $ F7�� �� *EditCommand+�� $ F6�� �� *DeleteCommand+.  (System.Windows.Interactivity.Interaction	   Triggers	 /  )System.Windows.Interactivity.EventTrigger  
   	EventName$
 Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+   CommandParameter ��  �� ElementName$ 	inputView��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�
 � Tag �� *Title+$ 	inputView��#  MaterialDesignThemes.Wpf.Card  $��0��$��Stretch=�$��5q�$��1��$	��Top=�.���� $��Phiếu nhập��$��5q�.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�.���  � ColumnDefinitions �� ��  � RowDefinitions �� �� �� �� �� .+��� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Tên hàng hóa��$��1��$��0��$��5q� �� 
IsEditable .  & "MaterialDesignFloatingHintComboBox#��[  �� DisplayMemberPath$ DisplayName������ *
ListObject+ �� SelectedItem �� *SelectedObject+�� $ Nhà cung cấp��{�.  $��0��$��0��$��5q� % !MaterialDesignFloatingHintTextBox#��[ ���� *%#SelectedObject.Supplier.DisplayName+�� $ Số lượng��$��0��$��1��$��5q�#��[ ���� *Count+�� $ Tình trạng��$��0��$��3��$��5q�#��[ {�.  ���� *Status+(	  "System.Windows.Controls.DatePicker	  $ Ngày nhập��$��1��$��3��$��5q� ( $MaterialDesignFloatingHintDatePicker#��[  	  SelectedDate �� *	DateInput+�� $ Giá nhập��$��0��$��2��$��5q�#��[ ���� *
InputPrice+�� $ 	Giá bán��$��1��$��2��$��5q�#��[ ���� *OutputPrice+�� $��1��$��4�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� $��50��$	��115��$��2q����	#FF49AEE8
����������� *
AddCommand+.���� $ 
Horizontal=�.+�'
  !MaterialDesignThemes.Wpf.PackIcon
  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�$��Stretch=��� 
Thêm (F5)�� $��50��$	��115��$��2q����	#FF49AEE8
����������� *DeleteCommand+.���� $ 
Horizontal=�.+�
  $ Delete=�$��Stretch=��� $��	Xóa (F6)���� $��50��$	��115��$��2q����	#FF49AEE8
����������� *EditCommand+.���� $ 
Horizontal=�.+�
  $ ModeEditOutline=�$��Stretch=��� $��
Sửa (F7)��  $��Stretch=�$	��Top=�$��5q�.���� $ Tìm kiếm hàng��$��5q����� *Search+ �� UpdateSourceTrigger$ PropertyChanged=�  $��Stretch=�$��5q�$��Bottom=�.���  �� �� �� �� .+��� $ Tổng số lượng��{�.  $��5q����� *
SumCount+�� $ Tổng tiền nhập��{�.  $��1��$��5q����� *SumInputPrice+  $��1��$��2��$��Stretch=�$��5q�$	��Top=�.���� $��Thống kê��$��5q�$ Light=�.��]� .+��� $
��Auto=�$
��Auto=�$	��Top=�.���� ���� *ListInputInfos+ �� Mode$ TwoWay=� �� *SelectedInputInfo+$ OneWayToSource=� �� View �� .P��� $��Tên hàng hóa�� �� DisplayMemberBinding �� *Object.DisplayName+�� $��Số lượng�� �� *Count+�� $��Giá nhập�� �� *
InputPrice+�� $��	Giá bán�� �� *OutputPrice+�� $��Tình trạng�� �� *Status+�� $��
Ngày bán�� �� *Input.DateInput+