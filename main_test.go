package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func performRequest(r http.Handler, method, path string) *httptest.ResponseRecorder {
	req, _ := http.NewRequest(method, path, nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)
	return w
}

func TestAPIPingEndpoint(t *testing.T) {
	// Build our expected body
	body := gin.H{
		"message": "pong",
	}
	// Grab our router
	router := setupRouter()
	APICalls(router)
	// Perform a GET request with that handler.
	w := performRequest(router, "GET", "/api/ping")
	// Assert we encoded correctly,
	// the request gives a 200
	assert.Equal(t, http.StatusOK, w.Code)
	// Convert the JSON response to a map
	var response map[string]string
	err := json.Unmarshal([]byte(w.Body.Bytes()), &response)
	// Grab the value & whether or not it exists
	value, exists := response["message"]
	// Make some assertions on the correctness of the response.
	assert.Nil(t, err)
	assert.True(t, exists)
	assert.Equal(t, body["message"], value)
}

func TestAPIInfoEndpoint(t *testing.T) {
	// Build our expected body
	body := gin.H{
		"info": "Server OK!!",
	}
	// Grab our router
	router := setupRouter()
	APICalls(router)
	// Perform a GET request with that handler.
	w := performRequest(router, "GET", "/api/info")
	// Assert we encoded correctly,
	// the request gives a 200
	assert.Equal(t, http.StatusOK, w.Code)
	// Convert the JSON response to a map
	var response map[string]string
	err := json.Unmarshal([]byte(w.Body.Bytes()), &response)
	// Grab the value & whether or not it exists
	value, exists := response["info"]
	// Make some assertions on the correctness of the response.
	assert.Nil(t, err)
	assert.True(t, exists)
	assert.Equal(t, body["info"], value)
}

func TestAPIRootEndpoint(t *testing.T) {
	router := setupRouter()

	APICalls(router)
	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/", nil)
	router.ServeHTTP(w, req)

	assert.Equal(t, 200, w.Code)
	assert.Equal(t, "Welcome to the Simple app =)", w.Body.String())
}
