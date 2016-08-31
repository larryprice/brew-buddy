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
	recipe.Info.parent = &recipe
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

type RecipeFermentables []RecipeFermentable

type RecipeFermentable struct {
	parent      *Recipe
	Type        string
	Description string
	Weight      string
	WeightUnits string
	Valid       bool
}

type RecipeInfo struct {
	parent      *Recipe
	Name        string
	Description string
	Brewers     string
	Valid       bool
}

func (r *RecipeInfo) SetDescription(desc string) {
	log.Print("Setting Description")
	go func() {
		r.Description = desc
		r.update()
	}()
}

func (r *RecipeInfo) SetName(name string) {
	log.Print("Setting Name")
	go func() {
		r.Name = name
		r.update()
	}()
}

func (r *RecipeInfo) SetBrewers(brewers string) {
	log.Print("Setting Brewers")
	go func() {
		r.Brewers = brewers
		r.update()
	}()
}

func (r *RecipeInfo) update() {
	r.Valid = r.Name != "" && r.Description != "" && r.Brewers != ""
	qml.Changed(r.parent, r)
}
