import { mbdao_backend } from "../../declarations/mbdao_backend";

document.getElementById("mottochange").addEventListener("click", async (e) => {
  console.log("mottochange clicked");
  
  // Interact with actor
  const new_orgmotto = await mbdao_backend.get_orgmotto();

  document.getElementById("orgmotto").innerText = new_orgmotto;
});

document.getElementById("orgchange").addEventListener("click", async (e) => {
  console.log("orgchange clicked");
  
  // Interact with actor
  const new_orgname = await mbdao_backend.get_orgname();

  document.getElementById("orgname").innerText = new_orgname;
});
