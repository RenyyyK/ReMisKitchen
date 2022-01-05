// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:remi_kitchen/models/ingredient.dart';
import 'package:remi_kitchen/models/measurement.dart';

import './models/recipe.dart';

var DUMMY_INGREDIENTS = [
  Ingredient(
    id: 'i1',
    name: 'Cattle Hack',
    unitOfMeasurement: UnitOfMeasurement.Gram,
  ),
  Ingredient(
      id: 'i2', name: 'Tomatoes', unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i3',
      name: 'Cucumber',
      unitOfMeasurement: UnitOfMeasurement.Unit,
     ),
  Ingredient(
      id: 'i4',
      name: 'Onion',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i5',
      name: 'Ketchup',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i6',
      name: 'Burger Buns',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i7',
      name: 'White Bread',
      unitOfMeasurement: UnitOfMeasurement.Slice),
  Ingredient(
      id: 'i8',
      name: 'Ham',
      unitOfMeasurement: UnitOfMeasurement.Slice),
  Ingredient(
      id: 'i9',
      name: 'Pineapple',
      unitOfMeasurement: UnitOfMeasurement.Slice),
  Ingredient(
      id: 'i10',
      name: 'Cheese',
      unitOfMeasurement: UnitOfMeasurement.Slice),
  Ingredient(
      id: 'i11',
      name: 'Butter',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i13',
      name: 'Spaghetti',
      unitOfMeasurement: UnitOfMeasurement.Gram),
  Ingredient(
      id: 'i14',
      name: 'Spices',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i15',
      name: 'Emmentaler',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i17',
      name: 'Olive Oil',
      unitOfMeasurement: UnitOfMeasurement.TableSpoons),
  Ingredient(
      id: 'i18',
      name: 'Arugula',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i19',
      name: 'Lamb\'s Lettuce',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i20',
      name: 'Parsley',
      unitOfMeasurement: UnitOfMeasurement.Unit,),
  Ingredient(
      id: 'i21',
      name: 'Fennel',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i22',
      name: 'Smoked Salmon',
      unitOfMeasurement: UnitOfMeasurement.Gram),
  Ingredient(
      id: 'i23',
      name: 'Mustard',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i24',
      name: 'Sheets of Gelatine',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i25',
      name: 'Orange Juice',
      unitOfMeasurement: UnitOfMeasurement.Liter),
  Ingredient(
      id: 'i26',
      name: 'Sugar',
      unitOfMeasurement: UnitOfMeasurement.Gram),
  Ingredient(
      id: 'i27',
      name: 'Yoghurt',
      unitOfMeasurement: UnitOfMeasurement.Gram),
  Ingredient(
      id: 'i28',
      name: 'Cream',
      unitOfMeasurement: UnitOfMeasurement.Gram),
  Ingredient(
      id: 'i29',
      name: 'All-purpose Flour',
      unitOfMeasurement: UnitOfMeasurement.Cups),
  Ingredient(
      id: 'i30',
      name: 'Baking Powder',
      unitOfMeasurement: UnitOfMeasurement.TeaSpoons),
  Ingredient(
      id: 'i32',
      name: 'White Sugar',
      unitOfMeasurement: UnitOfMeasurement.TableSpoons),
  Ingredient(
      id: 'i33',
      name: 'Milk',
      unitOfMeasurement: UnitOfMeasurement.Cups),
  Ingredient(
      id: 'i34',
      name: 'Egg',
      unitOfMeasurement: UnitOfMeasurement.Unit),
  Ingredient(
      id: 'i35',
      name: 'Balsamic Vinegar',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i37',
      name: 'Salt and Pepper',
      unitOfMeasurement: UnitOfMeasurement.None),
  Ingredient(
      id: 'i38',
      name: 'Orange Peel',
      unitOfMeasurement: UnitOfMeasurement.Unit),
];

var DUMMY_MEALS = [
  Recipe(
    id: 'm1',
    title: 'Spaghetti with Tomato Sauce',
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i17')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i5')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i13')==0),
            quantity: 250,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i14')==0),
            quantity: 1.5,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i15')==0),
            quantity: 1,
            extraDetails: 'optional'),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i2')==0),
            quantity: 4,
            extraDetails: ''),
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isLactoseFree: true,
    calories: 720,
  ),
  Recipe(
    id: 'm2',
    title: 'Toast Hawaii', //Feel free to add some cheese on the finished dish
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.elementAt(7),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.elementAt(8),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i10')==0),
            quantity: 1.5,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.elementAt(10),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.elementAt(6),
            quantity: 1,
            extraDetails: ''),
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isLactoseFree: false,
    calories: 300,
  ),
  Recipe(
      id: 'm3',
      title: 'Classic Hamburger',
      complexity: Complexity.Challenging,
      imageUrl:
          'https://restaumatic-production.imgix.net/uploads/accounts/28977/media_library/1c2af2c1-b3cf-4e10-abeb-303c98eaacaf.jpg?auto=compress&blur=0&crop=focalpoint&fit=crop&fp-x=1.5&fp-y=1.5&max-h=800&max-w=1100&rect=0%2C0%2C1600%2C2000',
      duration: 45,
      ingredients: [
        Measurement(
            ingredient: DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i2')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i3')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i4')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i5')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i6')==0),
            quantity: 2,
            extraDetails: ''),
        Measurement(
            ingredient: DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i1')==0),
            quantity: 300,
            extraDetails: ''),
      ],
      steps: [
        'Form 2 patties',
        'Fry the patties for c. 4 minutes on each side',
        'Quickly fry the buns for c. 1 minute on each side',
        'Bruch buns with ketchup',
        'Serve burger with tomato, cucumber and onion'
      ],
      isGlutenFree: false,
      isLactoseFree: true,
      calories: 879),
  Recipe(
    id: 'm5',
    title: 'Salad with Smoked Salmon',
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      Measurement(
            ingredient: DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i19')==0),
      
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i20')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i21')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i22')==0),
            quantity: 200,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i23')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i18')==0),
            quantity: 4,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i17')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i17')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i17')==0),
            quantity: 1,
            extraDetails: ''),
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isLactoseFree: true,
    calories: 200,
  ),
  Recipe(
    id: 'm6',
    title: 'Delicious Orange Mousse',
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i25')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i26')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i27')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i28')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i24')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
      DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i38')==0),
            quantity: 1,
            extraDetails: ''),
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isLactoseFree: false,
    calories: 300,
  ),
  Recipe(
      id: 'm7',
      title: 'Pancakes',
      complexity: Complexity.Simple,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
      duration: 20,
      ingredients: [
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i30')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i37')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i32')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i33')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i34')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i29')==0),
            quantity: 1,
            extraDetails: ''),
        Measurement(
            ingredient: 
        DUMMY_INGREDIENTS.firstWhere((element) => element.id.compareTo('i11')==0),
            quantity: 1,
            extraDetails: 'melted')
      ],
      steps: [
        'In a large bowl, sift together the flour, baking powder, salt and sugar.',
        'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
        'Heat a lightly oiled griddle or frying pan over medium high heat.',
        'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
      ],
      isGlutenFree: true,
      isLactoseFree: false,
      calories: 879),
];
