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
	context.SetVar("recipe", &recipe)

	win := component.CreateWindow(nil)

	win.Show()
	win.Wait()
	return nil
}

type Recipe struct {
	Info struct {
		Name        string
		Description string
		Brewers     string
		Valid       bool
	}
	Specifications struct {
		OG  string
		FG  string
		ABV string
		SRM string
		IBU string
	}
	Fermentables []struct {
		Type        string
		Description string
		Weight      string
		WeightUnits string
	}
}

func (r *Recipe) SetDescription(desc string) {
	log.Print("Setting Description")
	go func() {
		r.Info.Description = desc
		r.updateInfo()
	}()
}

func (r *Recipe) SetName(name string) {
	log.Print("Setting Name")
	go func() {
		r.Info.Name = name
		r.updateInfo()
	}()
}

func (r *Recipe) SetBrewers(brewers string) {
	log.Print("Setting Brewers")
	go func() {
		r.Info.Brewers = brewers
		r.updateInfo()
	}()
}

func (r *Recipe) updateInfo() {
	r.Info.Valid = r.Info.Name != "" && r.Info.Description != "" && r.Info.Brewers != ""
	qml.Changed(r, &r.Info)
}
