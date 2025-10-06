
## 📂 Estructura de carpetas sugerida

```
project-root/
├─ public/                      # Archivos estáticos públicos (favicon, manifest, imágenes globales)
│  └─ favicon.ico
│
├─ src/
│  ├─ assets/                   # Imágenes, fuentes y recursos estáticos importados desde el código
│  │  ├─ images/
│  │  └─ icons/
│  │
│  ├─ components/               # Componentes reutilizables (botones, modales, inputs, etc.)
│  │  ├─ ui/                    # Componentes básicos tipo shadcn/ui o atómicos
│  │  └─ layout/                # Layouts o wrappers generales (Header, Footer, Sidebar)
│  │
│  ├─ features/                 # Vistas o módulos funcionales (auth, dashboard, settings, etc.)
│  │  ├─ auth/
│  │  │  ├─ components/         # Componentes específicos del módulo
│  │  │  ├─ hooks/
│  │  │  ├─ services/
│  │  │  └─ pages/
│  │  └─ dashboard/
│  │     ├─ components/
│  │     ├─ hooks/
│  │     ├─ services/
│  │     └─ pages/
│  │
│  ├─ hooks/                    # Custom hooks compartidos (useFetch, useDebounce, etc.)
│  │
│  ├─ lib/                      # Configuración o utilidades externas (axios instance, API client, etc.)
│  │  ├─ api/
│  │  │  └─ client.ts
│  │  └─ utils/
│  │     ├─ formatters.ts
│  │     └─ validators.ts
│  │
│  ├─ context/                  # React Contexts (UserContext, ThemeContext, etc.)
│  │
│  ├─ routes/                   # Configuración de rutas con react-router-dom
│  │  └─ index.tsx
│  │
│  ├─ store/                    # Estado global (Zustand, Redux, Recoil, etc.)
│  │
│  ├─ styles/                   # Archivos Tailwind y estilos globales
│  │  ├─ index.css              # Punto de entrada Tailwind
│  │  └─ tailwind.css
│  │
│  ├─ App.tsx                   # Componente raíz
│  ├─ main.tsx                  # Punto de entrada de la app (ReactDOM.render)
│  └─ vite-env.d.ts             # Tipado de Vite
│
├─ .env                         # Variables de entorno
├─ .eslintrc.cjs                # Configuración ESLint
├─ .prettierrc                  # Configuración Prettier
├─ index.html                   # Plantilla principal Vite
├─ tailwind.config.js           # Configuración Tailwind
├─ postcss.config.js            # Configuración PostCSS
├─ tsconfig.json                # Configuración TypeScript (si aplica)
└─ vite.config.ts               # Configuración de Vite
```

---

## ⚙️ Explicación de buenas prácticas

- **`features/`** → Agrupa por funcionalidad, no por tipo. Esto mantiene el código escalable (por ejemplo, `auth` tiene sus propios componentes, hooks, servicios, etc.).
- **`components/ui`** → Ideal para componentes atómicos reutilizables (botones, inputs, cards).
- **`lib/api/client.ts`** → Configura Axios o Fetch con interceptores y headers comunes.
- **`context/`** → Centraliza contextos globales (tema, sesión, etc.).
- **`routes/`** → Mantiene la lógica de enrutamiento limpia y modular.
- **`styles/`** → Separa la configuración de Tailwind y los estilos globales.
- **`store/`** → Centraliza el manejo de estado global (si no usas context).
- **`hooks/` y `lib/utils/`** → Evita duplicación de lógica y fomenta reutilización.

---

## 🧩 Ejemplo de importaciones limpias (usando alias)

En `vite.config.ts` puedes agregar:
```ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
```

Y así puedes importar así:
```tsx
import { Button } from '@/components/ui/Button'
import { useAuth } from '@/features/auth/hooks/useAuth'
import { formatCurrency } from '@/lib/utils/formatters'
```

---
