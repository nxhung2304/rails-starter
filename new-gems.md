### Backend
| Thành phần | Gem | Ghi chú |
|---|---|---|
| Framework | `rails 8` | |
| Authentication | `devise` | Email + password |
| OAuth | `omniauth-google-oauth2` | Google login |
| Authorization | `cancancan` | Ability / permission |
| Role | `rolify` | Dynamic role assignment |
| Search | `ransack` | Search & filter |
| Pagination | `pagy` | Thay kaminari |
| Export Excel | `caxlsx` | `.xlsx` export |
| Audit log | `paper_trail` | Version history |
| Soft delete | `discard` | Thay paranoia |
| Background job | `sidekiq` | Async processing |
| Cache/Queue | `redis` | Sidekiq backend |
| File upload | `activestorage` | Built-in Rails |
| API | `grape` | REST API |
| API Docs | `grape-swagger` | Swagger UI |
| Form builder | `simple_form` | + DaisyUI config |

### Frontend
| Thành phần | Tool | Ghi chú |
|---|---|---|
| CSS | `tailwindcss-rails` | Utility-first |
| UI Components | `daisyui` | Theme + components |
| SPA-like | `turbo-rails` | Hotwire Turbo |
| JS | `stimulus-rails` | Hotwire Stimulus |

### Testing
| Thành phần | Gem | Ghi chú |
|---|---|---|
| Framework | `minitest` | Built-in Rails |
| Matchers | `shoulda-matchers` | Model/controller helpers |
| Factories | `factory_bot_rails` | Test data |
| Fake data | `faker` | Seed & fixtures |

### Code Quality
| Thành phần | Gem | Ghi chú |
|---|---|---|
| Linter | `rubocop-rails-omakase` | Rails 8 default config |
| Pre-commit | `overcommit` | Auto rubocop on commit |

---

