enum OrderFavoriteEnum {
  createdAtAsc(name: 'createdAt', isDesc: false),
  createdAtDesc(name: 'createdAt',isDesc: true),
  nameAsc(name: 'name',isDesc: false),
  nameDesc(name: 'name', isDesc: true);

  final String name;
  final bool isDesc;

  const OrderFavoriteEnum({required this.name, required this.isDesc});
}
