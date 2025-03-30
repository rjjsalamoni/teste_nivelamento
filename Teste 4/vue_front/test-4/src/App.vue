<template>
  <div class="container mx-auto p-4">
    <h1 class="text-2xl font-bold mb-4">Busca de Operadoras</h1>
    <input 
      v-model="query" 
      @input="search" 
      placeholder="Digite sua busca..." 
      class="border p-2 rounded w-full mb-4"
    />
    <table class="table-auto w-full border-collapse border border-gray-300">
      <thead>
        <tr class="bg-gray-100">
          <th v-for="(header, index) in headers" :key="index" class="border p-2">{{ header }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(row, rowIndex) in results" :key="rowIndex" class="border">
          <td v-for="(value, key) in row" :key="key" class="border p-2">{{ value }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      query: "",
      results: [],
      headers: []
    };
  },
  methods: {
    async search() {
      if (this.query.length > 2) {
        try {
          const response = await axios.get("http://127.0.0.1:5000/search", {
            params: { query: this.query }
          });
          this.results = response.data;
          this.headers = this.results.length > 0 ? Object.keys(this.results[0]) : [];
        } catch (error) {
          console.error("Erro ao buscar dados", error);
        }
      } else {
        this.results = [];
        this.headers = [];
      }
    }
  }
};
</script>

<style>
.container {
  max-width: 600px;
  margin: auto;
}
</style>