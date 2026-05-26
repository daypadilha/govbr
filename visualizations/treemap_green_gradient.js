(function() {
  const visObject = {
    // 1. Metadata & Options Configuration
    id: "treemap_green_gradient",
    label: "Treemap - Degradê Verde",
    options: {
      colorRange: {
        type: "string",
        label: "Esquema de Cores Verde",
        default: "emerald_glow",
        display: "select",
        values: [
          { "Emerald Glow (Tema Escuro Neon)": "emerald_glow" },
          { "Mint to Forest (Tema Claro)": "mint_forest" },
          { "Classic Green (Sólido Monocromático)": "classic" },
          { "Glass Forest (Translúcido Sofisticado)": "glass_forest" }
        ],
        section: "Design"
      },
      showLabels: {
        type: "boolean",
        label: "Mostrar Rótulos",
        default: true,
        section: "Conteúdo"
      },
      showValues: {
        type: "boolean",
        label: "Mostrar Valores das Métricas",
        default: true,
        section: "Conteúdo"
      },
      fontFamily: {
        type: "string",
        label: "Fonte do Texto",
        default: "Outfit, sans-serif",
        display: "select",
        values: [
          { "Outfit (Premium/Moderno)": "Outfit, sans-serif" },
          { "Inter (Limpo/Corporativo)": "Inter, sans-serif" },
          { "Roboto (Clássico)": "Roboto, sans-serif" },
          { "Padrão do Sistema": "system-ui, sans-serif" }
        ],
        section: "Design"
      },
      borderRadius: {
        type: "number",
        label: "Bordas Arredondadas (px)",
        default: 8,
        section: "Design"
      },
      gapSize: {
        type: "number",
        label: "Espaçamento entre Células (px)",
        default: 4,
        section: "Design"
      }
    },

    // 2. Initialize the Visualization State
    create: function(element, config) {
      // Inject styling with premium fonts and styles
      const style = document.createElement('style');
      style.id = 'custom-treemap-styles';
      style.innerHTML = `
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Outfit:wght@400;500;600;700&display=swap');
        
        .looker-treemap-container {
          width: 100%;
          height: 100%;
          position: relative;
          box-sizing: border-box;
          overflow: hidden;
          background: #0b0f19; /* Dark premium background by default */
          padding: 8px;
          user-select: none;
        }
        
        .looker-treemap-container.theme-mint_forest {
          background: #f8fafc; /* Soft light gray background for light theme */
        }
        
        .looker-treemap-node {
          position: absolute;
          box-sizing: border-box;
          transition: transform 0.35s cubic-bezier(0.16, 1, 0.3, 1), 
                      box-shadow 0.35s cubic-bezier(0.16, 1, 0.3, 1), 
                      filter 0.35s ease;
          cursor: pointer;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          overflow: hidden;
          padding: 8px;
          text-align: center;
        }
        
        .looker-treemap-node:hover {
          transform: scale(1.02);
          z-index: 10;
          box-shadow: 0 16px 38px rgba(0, 0, 0, 0.45);
          filter: brightness(1.2) saturate(1.15);
        }
        
        .theme-mint_forest .looker-treemap-node:hover {
          box-shadow: 0 16px 38px rgba(16, 185, 129, 0.25);
        }
        
        .looker-treemap-node-label {
          font-weight: 600;
          font-size: 13px;
          color: #ffffff;
          text-shadow: 0 2px 4px rgba(0,0,0,0.5);
          margin-bottom: 4px;
          width: 95%;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          pointer-events: none;
        }
        
        .theme-mint_forest .looker-treemap-node-label {
          text-shadow: 0 1px 2px rgba(0,0,0,0.3);
        }
        
        .looker-treemap-node-value {
          font-weight: 500;
          font-size: 11px;
          color: rgba(255, 255, 255, 0.85);
          text-shadow: 0 1px 3px rgba(0,0,0,0.5);
          pointer-events: none;
        }
        
        .theme-mint_forest .looker-treemap-node-value {
          text-shadow: 0 1px 2px rgba(0,0,0,0.3);
        }
        
        /* Glassmorphic premium tooltip inside container */
        .looker-treemap-tooltip {
          position: absolute;
          z-index: 100;
          background: rgba(15, 23, 42, 0.9);
          backdrop-filter: blur(16px);
          -webkit-backdrop-filter: blur(16px);
          border: 1px solid rgba(255, 255, 255, 0.12);
          border-radius: 12px;
          padding: 12px 16px;
          pointer-events: none;
          opacity: 0;
          transition: opacity 0.2s cubic-bezier(0.16, 1, 0.3, 1);
          box-shadow: 0 12px 32px rgba(0, 0, 0, 0.35);
          color: #ffffff;
          min-width: 180px;
          max-width: 260px;
        }
        
        .theme-mint_forest .looker-treemap-tooltip {
          background: rgba(255, 255, 255, 0.95);
          border: 1px solid rgba(0, 0, 0, 0.08);
          color: #0f172a;
          box-shadow: 0 12px 32px rgba(16, 185, 129, 0.12);
        }
        
        .looker-treemap-tooltip-title {
          font-weight: 700;
          font-size: 14px;
          margin-bottom: 6px;
          letter-spacing: -0.01em;
          border-bottom: 1px solid rgba(255, 255, 255, 0.1);
          padding-bottom: 4px;
        }
        
        .theme-mint_forest .looker-treemap-tooltip-title {
          border-bottom: 1px solid rgba(0, 0, 0, 0.08);
        }
        
        .looker-treemap-tooltip-row {
          display: flex;
          justify-content: space-between;
          font-size: 12px;
          margin-bottom: 4px;
          gap: 16px;
        }
        
        .looker-treemap-tooltip-row:last-child {
          margin-bottom: 0;
        }
        
        .looker-treemap-tooltip-label {
          color: rgba(255, 255, 255, 0.65);
        }
        
        .theme-mint_forest .looker-treemap-tooltip-label {
          color: rgba(15, 23, 42, 0.6);
        }
        
        .looker-treemap-tooltip-val {
          font-weight: 600;
        }
        
        /* Beautiful warning state */
        .looker-treemap-warning {
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          height: 100%;
          color: #94a3b8;
          font-size: 15px;
          text-align: center;
          padding: 24px;
          background: #0f172a;
          border-radius: 12px;
        }
        
        .looker-treemap-warning-icon {
          font-size: 44px;
          margin-bottom: 14px;
          color: #10b981;
        }
        
        .looker-treemap-warning-title {
          font-weight: 600;
          color: #f8fafc;
          margin-bottom: 6px;
        }
      `;
      document.head.appendChild(style);

      // Create main container
      const container = document.createElement('div');
      container.className = 'looker-treemap-container';
      element.appendChild(container);

      // Create tooltip element and place it inside container for absolute scoping
      const tooltip = document.createElement('div');
      tooltip.className = 'looker-treemap-tooltip';
      container.appendChild(tooltip);

      // Keep references on instance
      this.container = container;
      this.tooltip = tooltip;
    },

    // 3. Rendering Execution
    updateAsync: function(data, queryResponse, details, resp, done) {
      this.clearErrors();
      
      // Validate looker query fields
      const dimensions = queryResponse.fields.dimensions;
      const measures = queryResponse.fields.measures;
      const tableCalcs = queryResponse.fields.table_calculations || [];
      const allMeasures = [...measures, ...tableCalcs];

      // Error boundary for missing dimensions
      if (dimensions.length === 0) {
        this.addError({
          group: "dimension",
          title: "Dimensão Ausente",
          message: "Esta visualização requer pelo menos uma Dimensão para agrupar os retângulos."
        });
        this.container.innerHTML = `
          <div class="looker-treemap-warning">
            <div class="looker-treemap-warning-icon">🗺️</div>
            <div class="looker-treemap-warning-title">Dimensão Ausente</div>
            <div style="font-size: 13px; color: #64748b;">Adicione pelo menos uma dimensão (ex: Estado, Categoria) no painel lateral do Looker.</div>
          </div>
        `;
        done();
        return;
      }

      // Error boundary for missing measures
      if (allMeasures.length === 0) {
        this.addError({
          group: "measure",
          title: "Métrica Ausente",
          message: "Esta visualização requer pelo menos uma Métrica ou Cálculo de Tabela para dimensionar os retângulos."
        });
        this.container.innerHTML = `
          <div class="looker-treemap-warning">
            <div class="looker-treemap-warning-icon">📊</div>
            <div class="looker-treemap-warning-title">Métrica Ausente</div>
            <div style="font-size: 13px; color: #64748b;">Adicione uma métrica ou cálculo de tabela para dimensionar as células do Treemap de acordo com os valores.</div>
          </div>
        `;
        done();
        return;
      }

      // Map config settings (from user controls or defaults)
      const activeScheme = details.config.colorRange || this.options.colorRange.default;
      const showLabels = details.config.showLabels !== undefined ? details.config.showLabels : this.options.showLabels.default;
      const showValues = details.config.showValues !== undefined ? details.config.showValues : this.options.showValues.default;
      const font = details.config.fontFamily || this.options.fontFamily.default;
      const radius = details.config.borderRadius !== undefined ? details.config.borderRadius : this.options.borderRadius.default;
      const gap = details.config.gapSize !== undefined ? details.config.gapSize : this.options.gapSize.default;

      // Setup active configuration values
      this.container.style.fontFamily = font;
      
      // Re-inject basic hierarchy if updated
      this.container.innerHTML = '';
      this.container.className = `looker-treemap-container theme-${activeScheme}`;
      
      // Add tooltip back to container
      this.container.appendChild(this.tooltip);

      const dimensionField = dimensions[0].name;
      const measureField = allMeasures[0].name;

      // Process data rows
      const items = [];
      let totalValue = 0;
      let minValue = Infinity;
      let maxValue = -Infinity;

      data.forEach((row, idx) => {
        const dimCell = row[dimensionField];
        const measCell = row[measureField];
        
        if (dimCell && measCell !== undefined) {
          const rawVal = measCell.value;
          const val = parseFloat(rawVal);
          if (!isNaN(val) && val > 0) {
            items.push({
              id: `node-${idx}`,
              label: dimCell.rendered || dimCell.value || "Desconhecido",
              value: val,
              renderedValue: measCell.rendered || String(val),
              rawRow: row
            });
            totalValue += val;
            if (val < minValue) minValue = val;
            if (val > maxValue) maxValue = val;
          }
        }
      });

      // Handle zero/empty values
      if (items.length === 0) {
        this.container.innerHTML = `
          <div class="looker-treemap-warning">
            <div class="looker-treemap-warning-icon">📭</div>
            <div class="looker-treemap-warning-title">Sem Dados Válidos</div>
            <div style="font-size: 13px; color: #64748b;">Os dados retornados não contêm valores numéricos positivos para renderizar.</div>
          </div>
        `;
        done();
        return;
      }

      // Avoid division-by-zero when all metrics are identical
      if (minValue === maxValue) {
        minValue = maxValue - 1;
        if (minValue < 0) minValue = 0;
      }

      // Sort items in descending order for perfect packing
      items.sort((a, b) => b.value - a.value);

      // Get absolute boundaries of the container
      const rect = this.container.getBoundingClientRect();
      const padding = 8;
      const availableW = rect.width - padding * 2;
      const availableH = rect.height - padding * 2;

      // Perform binary treemap split partitioning
      divide(items, 0, 0, availableW, availableH);

      // Render individual cells
      const fragment = document.createDocumentFragment();

      items.forEach(item => {
        const node = document.createElement('div');
        node.className = 'looker-treemap-node';
        
        // Apply positions and spacing
        node.style.left = `${item.x + padding}px`;
        node.style.top = `${item.y + padding}px`;
        
        const nodeW = Math.max(0, item.w - gap);
        const nodeH = Math.max(0, item.h - gap);
        node.style.width = `${nodeW}px`;
        node.style.height = `${nodeH}px`;
        node.style.borderRadius = `${radius}px`;

        // Calculate interpolation value for the green gradient
        const pct = maxValue > minValue ? (item.value - minValue) / (maxValue - minValue) : 1.0;
        const styleParams = getGreenGradientColor(activeScheme, pct);
        
        node.style.background = styleParams.background;
        node.style.border = styleParams.border;

        // Check size constraints for text visibility
        const canShowLabel = showLabels && nodeW > 55 && nodeH > 26;
        const canShowValue = showValues && nodeW > 75 && nodeH > 45;

        if (canShowLabel) {
          const labelEl = document.createElement('span');
          labelEl.className = 'looker-treemap-node-label';
          labelEl.textContent = item.label;
          
          if (nodeW < 100 || nodeH < 50) {
            labelEl.style.fontSize = '11px';
          } else if (nodeW < 160 || nodeH < 80) {
            labelEl.style.fontSize = '12px';
          }
          node.appendChild(labelEl);
        }

        if (canShowValue) {
          const valueEl = document.createElement('span');
          valueEl.className = 'looker-treemap-node-value';
          valueEl.textContent = item.renderedValue;
          if (nodeW < 100 || nodeH < 50) {
            valueEl.style.fontSize = '9.5px';
          }
          node.appendChild(valueEl);
        }

        // Interactive events
        node.addEventListener('mouseenter', (e) => {
          const pctOfTotal = totalValue > 0 ? ((item.value / totalValue) * 100).toFixed(1) : '0.0';
          
          this.tooltip.innerHTML = `
            <div class="looker-treemap-tooltip-title">${item.label}</div>
            <div class="looker-treemap-tooltip-row">
              <span class="looker-treemap-tooltip-label">${measures[0].label_short || measures[0].label || 'Valor'}:</span>
              <span class="looker-treemap-tooltip-val">${item.renderedValue}</span>
            </div>
            <div class="looker-treemap-tooltip-row">
              <span class="looker-treemap-tooltip-label">Percentual:</span>
              <span class="looker-treemap-tooltip-val">${pctOfTotal}%</span>
            </div>
          `;
          this.tooltip.style.opacity = '1';
        });

        node.addEventListener('mousemove', (e) => {
          const containerRect = this.container.getBoundingClientRect();
          const tooltipW = this.tooltip.offsetWidth;
          const tooltipH = this.tooltip.offsetHeight;
          
          let posX = e.clientX - containerRect.left + 15;
          let posY = e.clientY - containerRect.top + 15;

          // Prevent tooltip from overflowing container boundaries
          if (posX + tooltipW > containerRect.width) {
            posX = e.clientX - containerRect.left - tooltipW - 15;
          }
          if (posY + tooltipH > containerRect.height) {
            posY = e.clientY - containerRect.top - tooltipH - 15;
          }

          // Apply boundaries to prevent negative overflow
          posX = Math.max(5, posX);
          posY = Math.max(5, posY);

          this.tooltip.style.left = `${posX}px`;
          this.tooltip.style.top = `${posY}px`;
        });

        node.addEventListener('mouseleave', () => {
          this.tooltip.style.opacity = '0';
        });

        fragment.appendChild(node);
      });

      this.container.appendChild(fragment);
      
      // Signal complete to Looker
      done();
    }
  };

  // Binary splitting algorithm for excellent aspect ratios
  function divide(items, x, y, w, h) {
    if (items.length === 0) return;
    if (items.length === 1) {
      items[0].x = x;
      items[0].y = y;
      items[0].w = w;
      items[0].h = h;
      return;
    }

    let sum = 0;
    for (let i = 0; i < items.length; i++) sum += items[i].value;

    let halfSum = 0;
    let splitIndex = 0;
    let minDiff = sum;
    
    for (let i = 0; i < items.length; i++) {
      halfSum += items[i].value;
      let diff = Math.abs(sum / 2 - halfSum);
      if (diff < minDiff) {
        minDiff = diff;
        splitIndex = i;
      } else {
        break;
      }
    }
    splitIndex = Math.max(0, Math.min(splitIndex, items.length - 2));

    let part1 = items.slice(0, splitIndex + 1);
    let part2 = items.slice(splitIndex + 1);

    let val1 = part1.reduce((a, b) => a + b.value, 0);
    let val2 = part2.reduce((a, b) => a + b.value, 0);
    let total = val1 + val2;

    if (w > h) {
      let w1 = total > 0 ? w * (val1 / total) : 0;
      let w2 = w - w1;
      divide(part1, x, y, w1, h);
      divide(part2, x + w1, y, w2, h);
    } else {
      let h1 = total > 0 ? h * (val1 / total) : 0;
      let h2 = h - h1;
      divide(part1, x, y, w, h1);
      divide(part2, x, y + h1, w, h2);
    }
  }

  // Green gradient generator with multi-schematic presets
  function getGreenGradientColor(scheme, pct) {
    let background, border;
    
    switch (scheme) {
      case 'emerald_glow':
        // Dark Theme Emerald Glow (Deep forest green to radiant neon emerald)
        const r1 = Math.round(12 + pct * (16 - 12));
        const g1 = Math.round(32 + pct * (185 - 32));
        const b1 = Math.round(20 + pct * (129 - 20));
        
        background = `linear-gradient(135deg, rgba(${r1}, ${g1}, ${b1}, 0.75) 0%, rgba(${r1+10}, ${g1+25}, ${b1+10}, 0.95) 100%)`;
        border = `1px solid rgba(16, 185, 129, ${0.15 + pct * 0.45})`;
        break;
        
      case 'mint_forest':
        // Soft mint to deep rich royal forest green (Light Theme)
        const r2 = Math.round(209 - pct * (209 - 6));
        const g2 = Math.round(250 - pct * (250 - 78));
        const b2 = Math.round(229 - pct * (229 - 59));
        background = `linear-gradient(135deg, rgb(${r2}, ${g2}, ${b2}) 0%, rgb(${Math.max(0, r2-20)}, ${Math.max(0, g2-25)}, ${Math.max(0, b2-20)}) 100%)`;
        border = `1px solid rgba(6, 78, 59, ${0.05 + pct * 0.12})`;
        break;
        
      case 'glass_forest':
        // Elegant translucence jade/emerald glow with fine light borders
        const r3 = Math.round(6 + pct * (46 - 6));
        const g3 = Math.round(70 + pct * (197 - 70));
        const b3 = Math.round(53 + pct * (136 - 53));
        background = `linear-gradient(135deg, rgba(${r3}, ${g3}, ${b3}, 0.55) 0%, rgba(${r3+8}, ${g3+18}, ${b3+8}, 0.75) 100%)`;
        border = `1px solid rgba(255, 255, 255, ${0.1 + pct * 0.25})`;
        break;

      case 'classic':
      default:
        // Standard solid monochrome green shades
        const r4 = Math.round(220 - pct * (220 - 35));
        const g4 = Math.round(238 - pct * (238 - 80));
        const b4 = Math.round(210 - pct * (210 - 20));
        background = `rgb(${r4}, ${g4}, ${b4})`;
        border = `1px solid rgba(35, 80, 20, 0.15)`;
        break;
    }
    
    return { background, border };
  }

  // Register visual plugin object in the Looker instance
  looker.plugins.visualizations.add(visObject);
}());
