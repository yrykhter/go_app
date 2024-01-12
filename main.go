package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	r := gin.Default()
	return r
}

func APICalls(r *gin.Engine) *gin.RouterGroup {
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

	return api
}

func InitRoutes(api *gin.RouterGroup) {
	api.GET("health", HealthCheck)
}

func HealthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "API is up and working fine",
	})
}

func main() {
	router := setupRouter()
	api := APICalls(router)
	InitRoutes(api)
	router.Run(":8080")
}
