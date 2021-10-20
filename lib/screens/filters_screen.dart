import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> filters;
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] ?? false;
    _vegetarian = widget.filters['vegetarian'] ?? false;
    _vegan = widget.filters['vegan'] ?? false;
    _lactoseFree = widget.filters['lactose'] ?? false;
    super.initState();
  }

  void _switchTarget(String target, bool val) {
    switch (target) {
      case 'gluten_free':
        setState(() {
          _glutenFree = val;
        });
        break;
      case 'vegetarian':
        setState(() {
          _vegetarian = val;
        });
        break;
      case 'vegan':
        setState(() {
          _vegan = val;
        });
        break;
      case 'lactose_free':
        setState(() {
          _lactoseFree = val;
        });
        break;
      default:
        break;
    }
  }

  Widget _buildSwitchListTile(
      String target, bool currentVal, String title, String subTitle) {
    return SwitchListTile(
      value: currentVal,
      onChanged: (val) => _switchTarget(target, val),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () => widget.saveFilters({
                    'gluten': _glutenFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                    'lactose': _lactoseFree
                  }),
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('gluten_free', this._glutenFree,
                  'Gluten-free', 'Only include gluten-free meals'),
              _buildSwitchListTile('vegetarian', this._vegetarian, 'Vegetarian',
                  'Only include vegetarian meals'),
              _buildSwitchListTile(
                  'vegan', this._vegan, 'Vegan', 'Only include vegan meals'),
              _buildSwitchListTile('lactose_free', this._lactoseFree,
                  'Lactose-free', 'Only include lactose-free meals'),
            ],
          ))
        ],
      ),
    );
  }
}
