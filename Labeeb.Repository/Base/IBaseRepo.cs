

using Microsoft.EntityFrameworkCore.Query;
using System.Linq.Expressions;

namespace Labeeb.Repository.Base;

public interface IBaseRepo<T> where T : class
{
    Task<T> AddAsync(T item);
    Task AddListAsync(List<T> items);
    Task<bool> CheckIfExistAsync(Expression<Func<T, bool>> expression);
    Task<List<T>> GetAllAsync(Expression<Func<T, bool>> expression, params Func<IQueryable<T>, IQueryable<T>>[] includes);
    Task<T> GetByAsync(Expression<Func<T, bool>> expression, params Func<IQueryable<T>, IQueryable<T>>[] includes);
    Task HardRemoveAsync(Expression<Func<T, bool>> predicate);
    Task RemoveAsync(Expression<Func<T, bool>> predicate, Expression<Func<SetPropertyCalls<T>, SetPropertyCalls<T>>> setProperties);
    Task SaveChangesAsync();
    Task UpdateAsync(Expression<Func<T, bool>> predicate, Expression<Func<SetPropertyCalls<T>, SetPropertyCalls<T>>> setProperties);
}
