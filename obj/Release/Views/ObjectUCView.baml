   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  '    !QuanLyKho_MVVM.Views.ObjectUCView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  (ucclr-namespace:QuanLyKho_MVVM.UC  c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  .local"clr-namespace:QuanLyKho_MVVM.Views  -   $��
objectUCVM��$��20(�   
ObjectUCVM  � DataContext#  [  
�������.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger     	EventName$ Loaded��.  (System.Windows.Interactivity.TriggerBase   Actions. 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+   CommandParameter ��  �� ElementName$ 
objectUCVM�� J� InputBindings �� 
 �� Key$ F5��	 �� Command	 �� *
AddCommand+�� $ F6��	 �� *DeleteCommand+�� $ F7��	 �� *EditCommand+.��]� .+�#  MaterialDesignThemes.Wpf.Card  $��5q�$	��Top=�.��9� $��Nhập loại mặt hàng��.  (MaterialDesignThemes.Wpf.ColorZoneAssist
   Mode$
 Light=�.��]� .+�� $	��Top=� � ColumnDefinitions �� ��  � RowDefinitions �� �� �� .+�� $��5q�.+��� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$
 Tên�� % !MaterialDesignFloatingHintTextBox#��[ ���� *DisplayName+� $��0��$��1��$��5q�.+��� $ 
Đơn vị�� �� DisplayMemberPath$ DisplayName�� & "MaterialDesignFloatingHintComboBox#��[ ���� *
ListUnit+ �� SelectedItem �� *SelectedUnit+� $��1��$��1��$��5q�.+��� $ Nhà cung cấp��#��[ $ DisplayName�� �� *SelectedSupplier+���� *ListSupplier+� $��5q�$��2��.+��� $ QRCode��#��[ ���� *QrCode+� $��5q�$��2��$��1��.+��� $ BarCode��#��[ ���� *	BarCode+�� $��1��$��1�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� $��50��$	��115��$��2q����	#FF49AEE8
����������� *
AddCommand+.���� $ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  �	  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 	  Kind$	 Add=�$��Stretch=��� 
Thêm (F5)�� $��50��$	��115��$��2q����	#FF49AEE8
����������� *DeleteCommand+.���� $ 
Horizontal=�.+�  $ Delete=�$��Stretch=��� $��	Xóa (F6)���� $��50��$	��115��$��2q����	#FF49AEE8
����������� *EditCommand+.���� $ 
Horizontal=�.+�  $ ModeEditOutline=�$��Stretch=��� $��
Sửa (F7)��  $��5q�$��Stretch=�$��Stretch=�.���� -    ��Name$ scrollViewer��$��1��$��5q�.���� ���� *
ListObject+ �� Mode$ TwoWay=� �� *SelectedObject+$ OneWayToSource=� �� View �� .P��� $
��Tên�� �� DisplayMemberBinding �� *DisplayName+�� $��
Đơn vị�� �� *Unit.DisplayName+�� $��Nhà cung cấp�� �� *Supplier.DisplayName+�� $��QRCode�� �� *QRCode+�� $��BarCode�� �� *	BarCode+