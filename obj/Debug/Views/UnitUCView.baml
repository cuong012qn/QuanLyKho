   M S B A M L   `   `   `  ����I  EQuanLyKho_MVVM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:QuanLyKho_MVVM.UCQuanLyKho_MVVM.UC  5      ;"clr-namespace:QuanLyKho_MVVM.ViewsQuanLyKho_MVVM.Views  5	      %    QuanLyKho_MVVM.Views.UnitUCView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      U QMaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      (ucclr-namespace:QuanLyKho_MVVM.UC  5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      .local"clr-namespace:QuanLyKho_MVVM.Views  5	      -   5        $��UnitUCVM��5      
�������$��20(�61      UnitUCVM  � DataContext#  [  5      .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCommand+   CommandParameter 5   $   ��  �� ElementName$ UnitUCVM��5       J� InputBindings 5      �� 5   
   
 �� Key$ F5��64   	 �� Command	 6   �� *
AddCommand+6?   �� 5   
   $ F7��65   	 6   �� *EditCommand+6@   �� 5   
   $ F6��67   	 6   �� *DeleteCommand+6B   .��5      )  #MaterialDesignThemes.Wpf.DialogHost  
   
Identifier$
 RootUnit��6    .��5   
   ]� .+�5      #  MaterialDesignThemes.Wpf.Card  $��5q�6"   $	��Top=�6-   .��5      �� $��Nhập đơn vị tính��6   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ Light=�65   .��5      � .+�5      �� $��1��6%   $��5q�65   .+�5      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Đơn vị tính��6&    % !MaterialDesignFloatingHintTextBox#��[ 6S   ��6�   �� *DisplayName+�� 5      $��1��6)   $��1��69    �� Orientation$ 
Horizontal=�6F   $��Right=�6_   $��0 10 0 0q�6{   .+�5    "   �� $��40��6)   $	��115��65   $��2q�6A   ���	#FF49AEE8
���������6L   �� *
AddCommand+.��5!   &   �� $ 
Horizontal=�61   .+�5"   *   '	  !MaterialDesignThemes.Wpf.PackIcon	  �
  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.6.0.325, Culture=neutral, PublicKeyToken=null]] 
  Kind$	 Add=�6B   $��Stretch=�6M   �� 5#   *   
Thêm (F5)6?   5$   '   5%   #   �� 5&   "   $��40��6)   $	��115��65   $��2q�6A   ���	#FF49AEE8
���������6L   �� *DeleteCommand+.��5'   &   �� $ 
Horizontal=�61   .+�5(   *   	  $ Delete=�6B   $��Stretch=�6P   �� 5)   *   $��	Xóa (F6)��64   6F   5*   '   5+   #   �� 5,   "   $��40��6)   $	��115��65   $��2q�6A   ���	#FF49AEE8
���������6L   �� *EditCommand+.��5-   &   �� $ 
Horizontal=�61   .+�5.   *   	  $ ModeEditOutline=�6B   $��Stretch=�6Y   �� 5/   *   $��
Sửa (F7)��64   6F   50   '   51   #   52      53      54      55      56        57      $��1��6"   $��5q�6/   $��Stretch=�6:   $��Stretch=�6X   .��58      �� -   5         ��Name$ scrollViewer��58   7   $��1��6   $��5q�6,   .��59      �� ��6   �� *
ListUnit+ �� Mode$ TwoWay=� �� SelectedItem 6M   �� *SelectedUnit+$ OneWayToSource=� �� View 5:      �� 5;      .P�5<   "   �� $��ID��61    �� DisplayMemberBinding 6=   �� *Id+6c   �� 5=   "   $
��Tên��61    6>   �� *DisplayName+6m   5>      5@      5A      5B      5C      5D      5E      