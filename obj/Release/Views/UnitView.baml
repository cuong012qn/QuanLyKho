   M S B A M L   `   `   `  ���� I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  #    QuanLyKho_MVVM.Views.UnitView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:QuanLyKho_MVVM.Views     U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  (ucclr-namespace:QuanLyKho_MVVM.UC  -   $��unitVM��$��15(�  � WindowStartupLocation$  CenterScreen=� 
  UnitVM � DataContext# [   � 
ResizeMode$ NoResize=� � WindowStyle$
 None=� � Title$ Đơn vị tính��$	��450��$	��410�� J� InputBindings �� 
 �� Key$ F5�� �� Command �� *
AddCommand+�� $ F7�� �� *EditCommand+�� $ F6�� �� *DeleteCommand+.  (System.Windows.Interactivity.Interaction   Triggers /  )System.Windows.Interactivity.EventTrigger  	   	EventName$	 Loaded��.  (System.Windows.Interactivity.TriggerBase
   Actions.
 6  0System.Windows.Interactivity.InvokeCommandAction     Command �� *LoadedWindowCommand+   CommandParameter ��  �� ElementName$ unitVM��.��]� .+�   QuanLyKho_MVVM.UC.UCBar  $	��Top=�
 � Tag �� *Title+$ unitVM���� $��5q�$	��Top=�._��� $��Nhập đơn vị tính��.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�.��� .+��� $��1��$��5q�.+��� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Đơn vị tính�� % !MaterialDesignFloatingHintTextBox#��[ ���� *DisplayName+�� $��1��$��1�� �� Orientation$ 
Horizontal=�$��Right=�$��0 10 0 0q�.+��� $��40��$	��115��$��2q����	#FF49AEE8
����������� *
AddCommand+.���� $ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  �	  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 	  Kind$	 Add=�$��Stretch=��� 
Thêm (F5)�� $��40��$	��115��$��2q����	#FF49AEE8
����������� *DeleteCommand+.���� $ 
Horizontal=�.+�  $ Delete=�$��Stretch=��� $��	Xóa (F6)���� $��40��$	��115��$��2q����	#FF49AEE8
����������� *EditCommand+.���� $ 
Horizontal=�.+�  $ ModeEditOutline=�$��Stretch=��� $��
Sửa (F7)���� $��1��$��5q�._��� -    ��Name$ scrollViewer��$��1��$��5q�.���� ���� *
ListUnit+ �� Mode$ TwoWay=� �� SelectedItem �� *SelectedUnit+$ OneWayToSource=� �� View �� .P��� $��ID�� �� DisplayMemberBinding �� *Id+�� $
��Tên�� �� *DisplayName+