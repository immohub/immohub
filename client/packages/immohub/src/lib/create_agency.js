export function createAgency(formData) {

  const data = formData

  return fetch('http://localhost:4000/api/agencies', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(data)
  })
  .then(response => response.json())
}
