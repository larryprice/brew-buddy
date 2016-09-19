package main

import (
	"gopkg.in/qml.v1"
	"log"
)

func main() {
	err := qml.Run(run)
	if err != nil {
		log.Fatal(err)
	}
}

func run() error {
	engine := qml.NewEngine()
  component, err := engine.LoadFile("share/qml/Main.qml")
	if err != nil {
		return err
	}

	context := engine.Context()

  recipe := Recipe{}
	recipe.Info.parent = &recipe
	recipe.Specifications.parent = &recipe
	recipe.Fermentables.parent = &recipe
	context.SetVar("recipe", &recipe)

	win := component.CreateWindow(nil)

	win.Show()
	win.Wait()
	return nil
}

type Recipe struct {
	Info           RecipeInfo
	Specifications RecipeSpecifications
	Fermentables   RecipeFermentables
}

type RecipeSpecifications struct {
	parent *Recipe
	OG     string
	FG     string
	ABV    string
	SRM    string
	IBU    string
	Valid  bool
}

type RecipeFermentables struct {
	parent *Recipe
	Valid  bool
	Items  []RecipeFermentable
	Len  int
}

type RecipeFermentable struct {
	FermType    string
	Description string
	Weight      string
	WeightUnits string
}

func (r *RecipeFermentables) Get(index int) RecipeFermentable {
	log.Print("Get fermentable with index ", index)
	if index > r.Len {
		return RecipeFermentable{}
	}
	return r.Items[index]
}

func (r *RecipeFermentables) Add(fermType string, description string, weight string, weightUnits string) {
	log.Print("Add fermentable")
	go func() {
		r.Items = append(r.Items, RecipeFermentable{
			FermType: fermType,
			Description: description,
			Weight: weight,
			WeightUnits: weightUnits,
		})
		r.update()
	}()
}

func (r *RecipeFermentables) Delete(index int) {
	log.Print("Delete fermentable")
	go func() {
		r.Items = append(r.Items[:index], r.Items[index+1:]...)
		r.update()
	}()
}

func (r *RecipeFermentables) Edit(index int, fermType string, description string, weight string, weightUnits string) {
	log.Print("Edit fermentable")
	go func() {
		temp := append(r.Items[:index], RecipeFermentable{
			FermType: fermType,
			Description: description,
			Weight: weight,
			WeightUnits: weightUnits,
		})
		r.Items = append(temp, r.Items[index+1:]...)
		r.update()
	}()
}

func (r *RecipeFermentables) update() {
	r.Len = len(r.Items)
	r.Valid = r.Len > 0
	qml.Changed(r.parent, r)
}

type RecipeInfo struct {
	parent      *Recipe
	Name        string
	Description string
	Brewers     string
	Valid       bool
}

func (r *RecipeInfo) SetDescription(desc string) {
	go func() {
		r.Description = desc
		r.update()
	}()
}

func (r *RecipeInfo) SetName(name string) {
	go func() {
		r.Name = name
		r.update()
	}()
}

func (r *RecipeInfo) SetBrewers(brewers string) {
	go func() {
		r.Brewers = brewers
		r.update()
	}()
}

func (r *RecipeInfo) update() {
	r.Valid = r.Name != "" && r.Description != "" && r.Brewers != ""
	qml.Changed(r.parent, r)
}
