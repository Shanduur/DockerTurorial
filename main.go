package main

import (
	"errors"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path"
	"sync"
)

type Opts struct {
	Args    []string
	WorkDir string
	Stdout  io.Writer
	Stderr  io.Writer
}

func New() *Opts {
	return &Opts{
		WorkDir: ".",
		Stdout:  os.Stdout,
		Stderr:  os.Stderr,
	}
}

func (o *Opts) SetArgs(args ...string) *Opts {
	o.Args = args
	return o
}

func (o *Opts) SetWorkdir(workdir string) *Opts {
	o.WorkDir = workdir
	return o
}

func spawn(command string, opts *Opts) {
	os.Chdir(opts.WorkDir)

	cmd := exec.Command(command, opts.Args...)

	cmd.Stderr = opts.Stderr
	cmd.Stdout = opts.Stdout

	err := cmd.Run()
	if err != nil {
		log.Printf("error occured: %s", err)
	}
}

func wrap(command string, opts *Opts, wg *sync.WaitGroup) {
	wg.Add(1)
	go func() {
		spawn(command, opts)
		wg.Done()
	}()
}

func main() {
	var wg sync.WaitGroup

	wd, err := os.Getwd()
	if err != nil {
		log.Fatalf("error getting current dir: %s", err)
	}

	spawn("git", New().SetArgs("reset", "--hard", "HEAD").SetWorkdir("./Resources/reveal.js"))

	err = os.Chdir(wd)
	if err != nil {
		log.Fatalf("error resetting working dir: %s", err)
	}

	if _, err := os.Stat("./Resources/reveal.js/index.html"); errors.Is(err, os.ErrNotExist) {
		// skip
	} else if err != nil {
		log.Fatalf("fatal error creating symlink: %s", err.Error())
	} else {
		err := os.RemoveAll("./Resources/reveal.js/index.html")
		if err != nil {
			log.Fatalf("error removing file: %s", err)
		}
	}

	err = os.Symlink(path.Join(wd, "index.html"), "./Resources/reveal.js/index.html")
	if err != nil {
		log.Fatalf("fatal error creating symlink: %s", err.Error())
	}

	wrap("npm", New().SetArgs("start").SetWorkdir("./Resources/reveal.js"), &wg)
	wrap("ttyd", New().SetArgs("-p 2375", "zsh"), &wg)

	fmt.Println(os.Getwd())

	wg.Wait()
}
