const issue = require("../../issue")
const result = require("../../result")
const schema = require("../../schema")

const function literalsSchemaBuilder<T>(...: T)
	local literals = { ... }

	return schema.createSchema<<T, nil>>(
		"literals",
		function(value)
			for _, literal in literals do
				if value == literal then
					return result.parse.ok(value :: T)
				end
			end

			return result.parse.err({
				issue.parse.invalidValue(`expected a literal value, got {value}`),
			})
		end
	)
end

return literalsSchemaBuilder
