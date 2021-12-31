import 'package:flutter/material.dart';
import 'package:remi_kitchen/models/ingredient.dart';

import './models/recipe.dart';

const DUMMY_MEALS = [
  Recipe(
    id: 'm1',
    title: 'Spaghetti with Tomato Sauce',
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      Ingredient(id: 'i10', name: 'Tomatoes', unitOfMeasurement: UnitOfMeasurement.Unit, quantity: 4 , extraDetails: ''),
      Ingredient(id: 'i11', name: 'Olive Oil', unitOfMeasurement: UnitOfMeasurement.TableSpoon, quantity: 1 , extraDetails: ''),
      Ingredient(id: 'i10', name: 'Onion', unitOfMeasurement: UnitOfMeasurement.Unit, quantity: 1 , extraDetails: ''),
      Ingredient(id: 'i11', name: 'Spaghetti', unitOfMeasurement: UnitOfMeasurement.Gram, quantity: 250 , extraDetails: ''),
      Ingredient(id: 'i10', name: 'Spices', unitOfMeasurement: UnitOfMeasurement.None, quantity: 1.5 , extraDetails: ''),
      Ingredient(id: 'i11', name: 'Cheese', unitOfMeasurement: UnitOfMeasurement.None, quantity: 1 , extraDetails: 'optional'),
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
    title: 'Toast Hawaii Feel free to add some cheese on the finished dish',
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      Ingredient(id: 'i7', name: 'White Bread', unitOfMeasurement: UnitOfMeasurement.Slice, quantity: 1 , extraDetails: ''),
      Ingredient(id: 'i8', name: 'Ham', unitOfMeasurement:  UnitOfMeasurement.Slice, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i9', name: 'Pineapple', unitOfMeasurement:  UnitOfMeasurement.Slice, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i10', name: 'Cheese', unitOfMeasurement: UnitOfMeasurement.Slice, quantity: 1.5 , extraDetails: ''),
      Ingredient(id: 'i11', name: 'Butter', unitOfMeasurement: UnitOfMeasurement.None, quantity: 1 , extraDetails: ''),
      
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
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      Ingredient(id: 'i1', name: 'Cattle Hack', unitOfMeasurement: UnitOfMeasurement.Gram, quantity: 300 , extraDetails: ''),
      Ingredient(id: 'i2', name: 'Tomato', unitOfMeasurement:  UnitOfMeasurement.Unit, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i3', name: 'Cucumber', unitOfMeasurement:  UnitOfMeasurement.Unit, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i4', name: 'Onion', unitOfMeasurement:  UnitOfMeasurement.Unit, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i5', name: 'Ketchup', unitOfMeasurement: UnitOfMeasurement.None, quantity: 1, extraDetails: ''),
      Ingredient(id: 'i6', name: 'Burger Buns', unitOfMeasurement: UnitOfMeasurement.Unit, quantity: 2, extraDetails: ''),

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
    calories: 879
  ),
];
