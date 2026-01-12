package com.example.repartoapp

import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.GridLayoutManager
import com.example.repartoapp.data.Paquete
import com.example.repartoapp.data.ZonaInfo
import com.example.repartoapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    
    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: RepartoViewModel
    private lateinit var zonasAdapter: ZonasAdapter
    
    private val zonasDisponibles = listOf(
        "Ruta 12",
        "Cañada Quiroz",
        "San Cayetano",
        "Riachuelo",
        "Sombrero",
        "Centro",
        "Norte",
        "Sur",
        "Este",
        "Oeste"
    )
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        viewModel = ViewModelProvider(this)[RepartoViewModel::class.java]
        
        setupUI()
        setupObservers()
    }
    
    private fun setupUI() {
        // Configurar RecyclerView para zonas
        zonasAdapter = ZonasAdapter(zonasDisponibles.map { ZonaInfo(it, Color.GRAY) }) { zona ->
            val intent = Intent(this, DetalleZonaActivity::class.java).apply {
                putExtra("ZONA", zona)
            }
            startActivity(intent)
        }
        
        binding.recyclerViewZonas.apply {
            layoutManager = GridLayoutManager(this@MainActivity, 2)
            adapter = zonasAdapter
        }
        
        // Configurar botones
        binding.fabScanQR.setOnClickListener {
            startActivity(Intent(this, ScannerActivity::class.java))
        }
        
        binding.btnCargarManual.setOnClickListener {
            startActivity(Intent(this, CargaManualActivity::class.java))
        }
        
        binding.btnCorregir.setOnClickListener {
            startActivity(Intent(this, CorregirActivity::class.java))
        }
    }
    
    private fun setupObservers() {
        viewModel.resumenZonas.observe(this) { resumen ->
            val zonasInfo = zonasDisponibles.map { nombreZona ->
                val resumenZona = resumen.find { it.zona == nombreZona }
                val color = if (resumenZona?.entregados == resumenZona?.count && resumenZona?.count ?: 0 > 0) {
                    Color.GREEN
                } else if (resumenZona?.entregados ?: 0 > 0) {
                    Color.YELLOW
                } else {
                    Color.RED
                }
                ZonaInfo(
                    nombre = nombreZona,
                    color = color,
                    paquetesCount = resumenZona?.count ?: 0,
                    completada = resumenZona?.entregados == resumenZona?.count && resumenZona?.count ?: 0 > 0
                )
            }
            zonasAdapter.updateData(zonasInfo)
        }
        
        viewModel.totalPaquetes.observe(this) { total ->
            binding.tvTotalPaquetes.text = "Total: $total"
        }
        
        viewModel.totalEntregados.observe(this) { entregados ->
            binding.tvEntregados.text = "Entregados: $entregados"
        }
    }
}
