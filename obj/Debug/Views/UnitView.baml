   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5   	   5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5	   	   #    QuanLyKho_MVVM.Views.UnitView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:QuanLyKho_MVVM.Views     5   	   U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   (ucclr-namespace:QuanLyKho_MVVM.UC  5	   	   -   5        $��unitVM��5   	   $��15(�5   	     � WindowStartupLocation$  CenterScreen=�5   	    
  UnitVM � DataContext# [  5   	    � 
ResizeMode$ NoResize=�6/    � WindowStyle$
 None=�6E    � Title$ Đơn vị tính��5   	   $	��450��6   $	��410��6*    J� InputBindings 5      �� 5   
   
 �� Key$ F5��64    �� Command 6   �� *
AddCommand+6?   �� 5   
   $ F7��65    6   �� *EditCommand+6@   �� 5   
   $ F6��67    6   �� *DeleteCommand+6B   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
   	   	EventName$	 Loaded��6   .  (System.Windows.Interactivity.TriggerBase
   Actions.
 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ unitVM��5      .��5      ]� .+�5   
      QuanLyKho_MVVM.UC.UCBar  $	��Top=�6   
 � Tag 6(   �� *Title+$ unitVM��6S   �� 5   
   $��5q�6   $	��Top=�6   ._�5      �� $��Nhập đơn vị tính��6   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�61   .��5      � .+�5       �� $��1��6!   $��5q�61   .+�5!      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Đơn vị tính��6"    % !MaterialDesignFloatingHintTextBox#��[ 6O   ��6�   �� *DisplayName+�� 5"      $��1��6%   $��1��65    �� Orientation$ 
Horizontal=�6B   $��Right=�6[   $��0 10 0 0q�6w   .+�5#      �� $��40��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *
AddCommand+.��5$   "   �� $ 
Horizontal=�6-   .+�5%   &   '  !MaterialDesignThemes.Wpf.PackIcon  �	  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 	  Kind$	 Add=�6>   $��Stretch=�6I   �� 5&   &   
Thêm (F5)6;   5'   #   5(      �� 5)      $��40��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *DeleteCommand+.��5*   "   �� $ 
Horizontal=�6-   .+�5+   &     $ Delete=�6>   $��Stretch=�6L   �� 5,   &   $��	Xóa (F6)��60   6B   5-   #   5.      �� 5/      $��40��6%   $	��115��61   $��2q�6=   ���	#FF49AEE8
���������6H   �� *EditCommand+.��50   "   �� $ 
Horizontal=�6-   .+�51   &     $ ModeEditOutline=�6>   $��Stretch=�6U   �� 52   &   $��
Sửa (F7)��60   6B   53   #   54      55      56      57      58      59      �� 5:   
   $��1��6   $��5q�6   ._�5;      �� -   5         ��Name$ scrollViewer��5;   3   $��1��6   $��5q�6(   .��5<      �� ��6   �� *
ListUnit+ �� Mode$ TwoWay=� �� SelectedItem 6I   �� *SelectedUnit+$ OneWayToSource=� �� View 5=      �� 5>      .P�5?      �� $��ID��6-    �� DisplayMemberBinding 69   �� *Id+6_   �� 5@      $
��Tên��6-    6:   �� *DisplayName+6i   5A      5C      5D      5E      5F      5G      