   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  2    ,QuanLyKho_MVVM.Views.ChangeInfoAdminUserView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:QuanLyKho_MVVM.Views     .ucclr-namespace:QuanLyKho_MVVM.UC     U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  -   $��changeInfoVM��$��20(�   AdminVM  � DataContext#  [   � Title$ Thay đổi thông tin��$	��600��$	��800�� � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=� J� InputBindings �� 
 �� Key$ F5�� �� Command �� *
AddCommand+�� $ F7�� �� *EditCommand+�� $ F6�� �� *DeleteCommand+.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger  	   	EventName$	 Loaded��.  (System.Windows.Interactivity.TriggerBase
   Actions.
 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedCommand+   CommandParameter ��  �� ElementName$ changeInfoVM��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�
 � Tag �� *Title+$ changeInfoVM���� 
����d�$��2q�$��Stretch=�$��Stretch=�$��5q�._�� $��5q� � ColumnDefinitions �� ��  � RowDefinitions �� $	��140 ��� $��80 ��� .+�� $��5q�$��Stretch=�$��Stretch=� �� �� .+��� .+��� $��Tên hiển thị���� ���� *DisplayName+ �� UpdateSourceTrigger$ PropertyChanged=��� $��1��.+��� $��Username���� ���� *
UserName+$ PropertyChanged=�� $��1��$��5q�$��Stretch=�$��Stretch=� �� �� .+��� .+��� $��Quyền���� $��20(� �� DisplayMemberPath$ DisplayName������ *ListUserRole+ �� SelectedItem �� *SelectedUserRole+ �� Mode$ TwoWay=�$ PropertyChanged=��� $��1��.+��� $��Password���� ���� *
Password+$ PropertyChanged=��� $��1��$��1�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� $��50��$	��115��$��2q����	#FF49AEE8
����������� *
AddCommand+.���� $ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]]   Kind$	 Add=�$��Stretch=��� 
Thêm (F5)�� $��50��$	��115��$��2q����	#FF49AEE8
����������� *DeleteCommand+.���� $ 
Horizontal=�.+�  $ Delete=�$��Stretch=��� $��	Xóa (F6)���� $��50��$	��115��$��2q����	#FF49AEE8
����������� *EditCommand+.���� $ 
Horizontal=�.+�  $ ModeEditOutline=�$��Stretch=��� $��
Sửa (F7)���� $��2��$��2��$
��Auto=�.���� ���� *
ListUser+ �� *SelectedItem+$ TwoWay=� �� View �� .P��� $��Tên hiển thị�� �� DisplayMemberBinding �� *DisplayName+�� $��Username�� �� *
UserName+�� $��Password�� �� *
Password+�� $��Quyền�� �� *UserRole.DisplayName+