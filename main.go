package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	r := gin.Default()
	return r
}

func APICalls(r *gin.Engine) {
	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Welcome to the Simple app =)")
	})

	api := r.Group("/api")

	api.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	api.GET("/info", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"info": "Server OK!!",
		})
	})
}

func main() {
	router := setupRouter()
	APICalls(router)
	router.Run(":8080")
}
