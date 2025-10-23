
package main

import (
    "fmt"
    "net/http"
    "os"
)

func main() {
    fmt.Println("🌍 Entorno activo:", os.Getenv("APP_ENV"))
    
    if len(os.Args) > 1 && os.Args[1] == "-health" {
        resp, err := http.Get("http://localhost:8080/health")
        if err != nil || resp.StatusCode != 200 {
            os.Exit(1)
        }
        os.Exit(0)
    }

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "🚀 Docker Compose con Go está corriendo correctamente")
    })
    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
        w.WriteHeader(http.StatusOK)
        fmt.Fprintln(w, `{"status":"ok"}`)
    })
    http.ListenAndServe(":8080", nil)
}

